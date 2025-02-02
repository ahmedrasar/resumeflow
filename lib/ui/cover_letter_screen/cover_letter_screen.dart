import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/models/cover_letter_models/cover_letter_models.dart';
import 'package:resumeflow/services/cover_letter_gen_service/cover_letter_gen_service.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';
import 'package:flutter/services.dart';
import 'package:resumeflow/utils/file_saver/file_saver.dart';
import 'package:resumeflow/utils/layout_helper/layout_helper.dart';

class CoverLetterScreen extends StatefulWidget {
  const CoverLetterScreen({super.key});

  @override
  State<CoverLetterScreen> createState() => _CoverLetterScreenState();
}

class _CoverLetterScreenState extends State<CoverLetterScreen> {
  late ThemeData theme;
  late ResumeflowLocalizations l10n;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
    l10n = ResumeflowLocalizations.of(context);
    if (validatedBefore) {
      _formKey.currentState!.validate();
    }
  }

  final _formKey = GlobalKey<FormState>();
  var validatedBefore = false;

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

  bool _loading = false;

  Widget _buildTextField({
    required String fieldName,
    required String tooltip,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 5,
          children: [
            SizedBox(width: 10),
            Text(
              fieldName,
              style: theme.textTheme.titleMedium,
            ),
            Tooltip(
              message: tooltip,
              child: Icon(
                Icons.info_outline_rounded,
                size: 15,
                color: theme.iconTheme.color?.withAlpha(150),
              ),
            )
          ],
        ),
        TextFormField(
          controller: controller,
          minLines: 1,
          maxLines: 5,
          onChanged: (value) {
            if (validatedBefore) _formKey.currentState!.validate();
          },
          keyboardType: keyboardType,
          validator: (value) => value!.isEmpty ? l10n.empytFieldError : null,
          decoration: InputDecoration(
            hintText: fieldName,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color?.withAlpha(100)),
            filled: true,
            fillColor: theme.colorScheme.onPrimary.withAlpha(125),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final layoutHelper = LayoutHelper(width: MediaQuery.sizeOf(context).width);

    final formBackgroundColor = theme.colorScheme.surface;
    final content = Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Padding(
          padding: layoutHelper.isWide()
              ? const EdgeInsets.symmetric(vertical: 20)
              : EdgeInsets.zero,
          child: Material(
            color: formBackgroundColor,
            elevation: layoutHelper.isWide() ? 10 : 0,
            borderRadius:
                layoutHelper.isWide() ? BorderRadius.circular(10) : null,
            child: ScrollConfiguration(
              behavior: ScrollBehavior().copyWith(scrollbars: false),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
                child: Column(
                  spacing: 40,
                  children: [
                    _buildForm(),
                    _bulildSummitBtn(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: formBackgroundColor,
      body: layoutHelper.isWide() ? GridBackground(child: content) : content,
    );
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 20,
        children: [
          _buildTextField(
              fieldName: l10n.companyName,
              tooltip: l10n.companyNameTooltip,
              controller: _companyNameController),
          _buildTextField(
              fieldName: l10n.jobPost,
              tooltip: l10n.jobPostTooltip,
              controller: _jobPostController),
          _buildTextField(
              fieldName: l10n.applicantName,
              tooltip: l10n.applicantNameTooltip,
              controller: _applicantNameController),
          _buildTextField(
              fieldName: l10n.applicantDegree,
              tooltip: l10n.applicantDegreeTooltip,
              controller: _degreeController),
          _buildTextField(
              fieldName: l10n.applicantTitle,
              tooltip: l10n.applicantTitleTooltip,
              controller: _applicantTitleController),
          _buildTextField(
              fieldName: l10n.experience,
              tooltip: l10n.experienceTooltip,
              controller: _experienceController),
          _buildTextField(
              fieldName: l10n.skills,
              tooltip: l10n.skillsTooltip,
              controller: _skillsController),
          _buildTextField(
              fieldName: l10n.address,
              tooltip: l10n.addressTooltip,
              controller: _addressController),
          _buildTextField(
              fieldName: l10n.telephone,
              tooltip: l10n.telephoneTooltip,
              controller: _telephoneController,
              keyboardType: TextInputType.phone),
          _buildTextField(
              fieldName: l10n.email,
              tooltip: l10n.emailTooltip,
              controller: _emailController),
        ],
      ),
    );
  }

  Future<CoverLetterModel> __generateCoverletter() async {
    final data = CoverLetterData(
        companyName: _applicantNameController.text,
        jobPost: _jobPostController.text,
        name: _applicantNameController.text,
        address: _addressController.text,
        telephone: _telephoneController.text,
        email: _emailController.text,
        degree: _degreeController.text,
        title: _applicantTitleController.text,
        experience: _experienceController.text,
        skills: _skillsController.text);

    final service = CoverLetterGenerationService(http.Client());
    final genData =
        await service.generateData(CoverLetterRequestModel(data: data));

    return CoverLetterModel(data: data, genData: genData);
  }

  Widget _bulildSummitBtn() {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(200, 50)),
        maximumSize: WidgetStatePropertyAll(Size(225, 50)),
        backgroundColor: WidgetStatePropertyAll(
            _loading ? Colors.grey.shade800 : theme.colorScheme.secondary),
      ),
      onPressed: _loading
          ? null
          : () async {
              validatedBefore = true;
              if (!_formKey.currentState!.validate()) return;

              setState(() {
                _loading = true;
              });

              try {
                final coverLetter = await __generateCoverletter();
                if (mounted) {
                  await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return _buildCoverLetterAlert(context, coverLetter);
                      });
                }
              } on CoverLetterGenerationServiceException catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      width: 300,
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        l10n.serverError(e.response.statusCode),
                        textAlign: TextAlign.center,
                      ),
                      elevation: 10,
                      backgroundColor: theme.colorScheme.error));
                }
                rethrow;
              } finally {
                setState(() {
                  _loading = false;
                });
              }
            },
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

  AlertDialog _buildCoverLetterAlert(
      BuildContext context, CoverLetterModel coverLetter) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      title: Text(l10n.generatedCoverLetter),
      content: ConstrainedBox(
        constraints: BoxConstraints.loose(Size(600, 1200)),
        child: Stack(
          children: [
            Card.filled(
              color: theme.colorScheme.surface,
              margin: EdgeInsets.all(10),
              child: Text(
                coverLetter.generatedBody,
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
                      ClipboardData(text: coverLetter.generatedBody));
                },
                tooltip: l10n.copy,
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(theme.colorScheme.tertiary)),
                icon: Icon(Icons.copy_all),
              ),
            )
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.close),
        ),
        FilledButton(
          onPressed: () async {
            await FileSaver.saveCoverLetter(coverLetter,
                prompt: l10n.chooseDownloadDir);
          },
          child: Text(l10n.exportToDocx),
        ),
      ],
    );
  }
}
