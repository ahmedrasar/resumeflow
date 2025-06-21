import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart' hide PdfDocument;
import 'package:pdfx/pdfx.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/models/document_models/document_models.dart';
import 'package:resumeflow/models/gen_ai_service/gen_ai_service.dart';
import 'package:resumeflow/services/gemini_service/gemini_service.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';
import 'package:flutter/services.dart';
import 'package:resumeflow/utils/docx_util/cover_letter_docx_util/cover_letter_docx_util.dart';
import 'package:resumeflow/utils/file_saver/file_saver.dart';
import 'package:resumeflow/utils/pdf_util/cover_letter_pdf_util/cover_letter_pdf_util.dart';
import 'package:resumeflow/utils/pdf_util/pdf_util.dart';
import 'package:resumeflow/utils/platform_helper/platform_helper.dart';

class CoverLetterScreen extends StatefulWidget {
  const CoverLetterScreen({super.key});

  @override
  State<CoverLetterScreen> createState() => _CoverLetterScreenState();
}

class _CoverLetterScreenState extends State<CoverLetterScreen> {
  late ThemeData theme;
  late ResumeflowLocalizations l10n;

  final _formKey = GlobalKey<FormState>();
  final _docxUtil = CoverLetterDocxUtil();
  late PdfControllerPinch pdfController;
  var validatedBefore = false;
  bool _loading = false;
  late final Timer? timer;
  late bool _shoudRepaintPdf;

  // Recipient Controllers
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _jobPostController = TextEditingController();

  // Applicant Controllers
  final TextEditingController _applicantNameController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _applicantTitleController =
      TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();

  late bool _compactView;
  BuildContext? _compactPdfPreviewContext;
  late CoverLetterModel model;

  @override
  void dispose() {
    _companyNameController.dispose();
    _jobPostController.dispose();
    _applicantNameController.dispose();
    _addressController.dispose();
    _telephoneController.dispose();
    _emailController.dispose();
    _degreeController.dispose();
    _applicantTitleController.dispose();
    _experienceController.dispose();
    _skillsController.dispose();
    pdfController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pdfController = PdfControllerPinch(
      document: PdfDocument.openData(PdfUtil.buildEmptyPage()),
    );
    _shoudRepaintPdf = false;
    timer = Timer.periodic(Duration(milliseconds: 500), (_) async {
      if (_shoudRepaintPdf && !_compactView) {
        model = await _generateDocumentModel();
        await _reloadPdfPreview();
        _shoudRepaintPdf = false;
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
    _compactView = context.platformHelper.isCompact;
    if (!_compactView && _compactPdfPreviewContext != null) {
      Navigator.of(_compactPdfPreviewContext!).pop();
      _compactPdfPreviewContext = null;
      _shoudRepaintPdf = true;
    }
    l10n = ResumeflowLocalizations.of(context);
    _docxUtil.l10n = l10n;
    if (validatedBefore) {
      _formKey.currentState?.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final platformHelper = context.platformHelper;
    final formBackgroundColor = theme.colorScheme.surface;
    final form = _buildForm(platformHelper, formBackgroundColor);

    return platformHelper.isCompact ? _buildCompact(form) : _buildWide(form);
  }

  Widget _buildCompact(Widget form) {
    return Scaffold(
      body: SingleChildScrollView(child: form),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          model = await _generateDocumentModel();
          if (!mounted) return;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                _compactPdfPreviewContext = context;
                return Center(
                  child: Stack(
                    children: [
                      FittedBox(
                        child: SizedBox(
                          width: PdfPageFormat.a4.width,
                          height: PdfPageFormat.a4.height,
                          child: PdfViewPinch(
                            controller: PdfControllerPinch(
                              document: PdfDocument.openData(
                                CoverLetterPdfUtil().fromModel(model),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _compactPdfPreviewContext = null;
                        },
                        icon: Icon(
                          Icons.close,
                          // To contrast with the pdf's white background
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
        child: Icon(Icons.preview),
      ),
    );
  }

  Widget _buildWide(Widget form) {
    return GridBackground(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Material(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ScrollConfiguration(
                        behavior: ScrollBehavior().copyWith(scrollbars: false),
                        child: SingleChildScrollView(child: form),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.loose(Size(5, 1200)),
                    child: VerticalDivider(indent: 10, endIndent: 10),
                  ),
                  Flexible(child: _buildPdfPreview()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPdfPreview() {
    return FittedBox(
      child: SizedBox(
        width: PdfPageFormat.a4.width,
        height: PdfPageFormat.a4.height,
        child: PdfViewPinch(controller: pdfController),
      ),
    );
  }

  Widget _buildForm(PlatformHelper platformHelper, Color formBackgroundColor) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600),
      child: Material(
        color: formBackgroundColor,
        elevation: platformHelper.isCompact ? 10 : 0,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 20,
            children: [_buildFormFields(), _buildCreateBtn()],
          ),
        ),
      ),
    );
  }

  Widget _buildFormTextField({
    required String fieldName,
    required String tooltip,
    required String example,
    required TextEditingController controller,
    TextInputType? keyboardType,
    int lines = 1,
    bool redrawOnChange = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 5,
          children: [
            SizedBox(width: 5),
            Text(fieldName, style: theme.textTheme.titleMedium),
            Tooltip(
              message: tooltip,
              child: Icon(
                Icons.info_outline_rounded,
                size: 15,
                color: theme.iconTheme.color?.withAlpha(150),
              ),
            ),
          ],
        ),
        TextFormField(
          controller: controller,
          minLines: lines,
          maxLines: lines,
          onTap: () => _shoudRepaintPdf = true,
          onChanged: (_) {
            if (redrawOnChange) {
              _shoudRepaintPdf = true;
            }

            if (validatedBefore) _formKey.currentState!.validate();
          },
          keyboardType: keyboardType,
          validator: (value) => value!.isEmpty ? l10n.empytFieldError : null,
          decoration: InputDecoration(
            hintText: example,
            alignLabelWithHint: true,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withAlpha(75),
            ),
            filled: true,
            fillColor: theme.colorScheme.onPrimary.withAlpha(125),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }

  Widget _buildFormFields() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 20,
        children: [
          _buildFormTextField(
            fieldName: l10n.applicantName,
            tooltip: l10n.applicantNameTooltip,
            example: l10n.applicantNameExample,
            controller: _applicantNameController,
            redrawOnChange: true,
          ),
          _buildFormTextField(
            fieldName: l10n.address,
            tooltip: l10n.addressTooltip,
            example: l10n.addressExample,
            controller: _addressController,
            redrawOnChange: true,
          ),
          _buildFormTextField(
            fieldName: l10n.telephone,
            tooltip: l10n.telephoneTooltip,
            example: l10n.telephoneExample,
            controller: _telephoneController,
            keyboardType: TextInputType.phone,
            redrawOnChange: true,
          ),
          _buildFormTextField(
            fieldName: l10n.email,
            tooltip: l10n.emailTooltip,
            example: l10n.emailExample,
            controller: _emailController,
            redrawOnChange: true,
          ),
          _buildFormTextField(
            fieldName: l10n.applicantDegree,
            tooltip: l10n.applicantDegreeTooltip,
            example: l10n.applicantDegreeExample,
            controller: _degreeController,
          ),
          _buildFormTextField(
            fieldName: l10n.applicantTitle,
            tooltip: l10n.applicantTitleTooltip,
            example: l10n.applicantTitleExample,
            controller: _applicantTitleController,
          ),
          _buildFormTextField(
            fieldName: l10n.experience,
            tooltip: l10n.experienceTooltip,
            example: l10n.experienceExample,
            controller: _experienceController,
            lines: 3,
          ),
          _buildFormTextField(
            fieldName: l10n.skills,
            tooltip: l10n.skillsTooltip,
            example: l10n.skillsExample,
            controller: _skillsController,
            lines: 3,
          ),
          _buildFormTextField(
            fieldName: l10n.companyName,
            tooltip: l10n.companyNameTooltip,
            example: l10n.companyNameExample,
            controller: _companyNameController,
          ),
          _buildFormTextField(
            fieldName: l10n.jobPost,
            tooltip: l10n.jobPostTooltip,
            example: l10n.jobPostExample,
            controller: _jobPostController,
            lines: 5,
          ),
        ],
      ),
    );
  }

  Future<void> _reloadPdfPreview() async {
    final bytes = await CoverLetterPdfUtil().fromModel(model);
    await pdfController.loadDocument(PdfDocument.openData(bytes));
    if (!_compactView) setState(() {});
  }

  Future<CoverLetterModel> _generateDocumentModel() async {
    final acquiredData = AcquiredData(
      companyName: _companyNameController.text,
      jobPost: _jobPostController.text,
      name: _applicantNameController.text,
      address: _addressController.text,
      telephone: _telephoneController.text,
      email: _emailController.text,
      degree: _degreeController.text,
      title: _applicantTitleController.text,
      experience: _experienceController.text,
      skills: _skillsController.text,
    );

    final genAiService = GeminiService(acquiredData, l10n);

    final genData = await genAiService.genCoverLetter();
    return CoverLetterModel.fromData(data: acquiredData, genData: genData);
  }

  Widget _buildCreateBtn() {
    return ElevatedButton(
      style: ButtonStyle(
        maximumSize: WidgetStatePropertyAll(Size(250, 50)),
        backgroundColor: WidgetStatePropertyAll(
          _loading
              ? Colors.grey.shade800
              : theme.colorScheme.secondary.withAlpha(200),
        ),
      ),
      onPressed: _loading ? null : _createCoverLetter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Text(
            l10n.createCoverLetter,
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          if (_loading)
            CircularProgressIndicator(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints.tight(Size(15, 15)),
            ),
        ],
      ),
    );
  }

  void _createCoverLetter() async {
    validatedBefore = true;
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
    });

    try {
      if (mounted) {
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return _buildCoverLetterAlert(context, model);
          },
        );
      }
    } on GenAiException catch (exception) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(_buildErrorSnackBar(exception));
      }
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  SnackBar _buildErrorSnackBar(GenAiException exception) {
    return SnackBar(
      width: 300,
      behavior: SnackBarBehavior.floating,
      content: Text(
        l10n.serverError(exception.code),
        textAlign: TextAlign.center,
      ),
      elevation: 10,
      backgroundColor: theme.colorScheme.error,
    );
  }

  Widget _buildCoverLetterAlert(
    BuildContext context,
    CoverLetterModel coverLetter,
  ) {
    final bodyTextController = TextEditingController(text: coverLetter.body);
    return AlertDialog(
      scrollable: true,
      insetPadding: EdgeInsets.all(20),
      title: Text(l10n.generatedCoverLetter),
      content: ConstrainedBox(
        constraints: BoxConstraints.loose(Size(600, 1200)),
        child: Stack(
          children: [
            Card.filled(
              color: theme.colorScheme.surface,
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: bodyTextController,
                maxLines: null,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            Positioned.directional(
              textDirection: Directionality.of(context),
              end: 5,
              top: 0,
              child: IconButton(
                onPressed: () async {
                  await Clipboard.setData(
                    ClipboardData(text: bodyTextController.text),
                  );
                },
                tooltip: l10n.copy,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    theme.colorScheme.tertiary,
                  ),
                ),
                icon: Icon(Icons.copy_all),
              ),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.close, style: TextStyle(color: Colors.red)),
        ),
        FilledButton(
          onPressed: () async {
            final editedCoverLetter = coverLetter.copyWith(
              body: bodyTextController.text,
            );
            await _exportToDocx(editedCoverLetter);
          },
          child: Text(l10n.exportToDocx),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: theme.colorScheme.tertiary,
          ),
          onPressed: () async {
            final editedCoverLetter = coverLetter.copyWith(
              body: bodyTextController.text,
            );
            await _exportToPdf(editedCoverLetter);
          },
          child: Text(l10n.exportToPdf),
        ),
      ],
    );
  }

  Future<void> _exportToDocx(CoverLetterModel model) async {
    await FileSaver.saveAs(
      await _docxUtil.fromModel(model),
      fileName: _downloadedFileName(model, 'docx'),
      prompt: l10n.chooseDownloadDir,
    );
  }

  Future<void> _exportToPdf(CoverLetterModel model) async {
    await FileSaver.saveAs(
      await CoverLetterPdfUtil().fromModel(model),
      fileName: _downloadedFileName(model, 'pdf'),
      prompt: l10n.chooseDownloadDir,
    );
  }

  String _downloadedFileName(CoverLetterModel model, String extension) {
    return '${model.companyName}_${l10n.coverLetter.replaceAll(' ', '-')}.$extension';
  }
}
