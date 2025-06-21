import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart' hide PdfDocument;
import 'package:pdfx/pdfx.dart';
import 'package:provider/provider.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/models/px_models/pk_resume_model.dart';
import 'package:resumeflow/repos/settings_repository/settings_repository.dart';
import 'package:resumeflow/services/pk_service/pk_service.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';
import 'package:resumeflow/utils/file_saver/file_saver.dart';
import 'package:resumeflow/utils/pdf_util/pdf_util.dart';
import 'package:resumeflow/utils/platform_helper/platform_helper.dart';

class EduControllers {
  final TextEditingController degree = TextEditingController();
  final TextEditingController school = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController gpa = TextEditingController();

  EduControllers();

  PkEducation get data => PkEducation(
    degree: degree.text,
    school: school.text,
    location: location.text,
    startDate: startDate.text,
    endDate: endDate.text,
    gpa: gpa.text,
  );

  bool get isEmpty =>
      degree.text.isEmpty &&
      school.text.isEmpty &&
      location.text.isEmpty &&
      startDate.text.isEmpty &&
      endDate.text.isEmpty &&
      gpa.text.isEmpty;
}

class ProjControllers {
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController skills = TextEditingController();

  ProjControllers();

  PkProject get data => PkProject(
    name: name.text,
    description: description.text,
    endDate: endDate.text,
    skills: skills.text,
  );

  bool get isEmpty =>
      name.text.isEmpty &&
      description.text.isEmpty &&
      endDate.text.isEmpty &&
      skills.text.isEmpty;
}

class ExpControllers {
  final TextEditingController company = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();

  ExpControllers();

  PkExperience get data => PkExperience(
    company: company.text,
    title: title.text,
    description: description.text,
    startDate: startDate.text,
    endDate: endDate.text,
  );

  bool get isEmpty =>
      company.text.isEmpty &&
      title.text.isEmpty &&
      description.text.isEmpty &&
      startDate.text.isEmpty &&
      endDate.text.isEmpty;
}

List<String> _csvToList(String csv) {
  return csv.split(',').map((e) => e.trim()).toList();
}

class SkillsControllers {
  final TextEditingController programmingLanguages = TextEditingController();
  final TextEditingController tools = TextEditingController();
  final TextEditingController otherSkills = TextEditingController();

  SkillsControllers();

  PkTechnicalSkills get data => PkTechnicalSkills(
    programmingLanguages: _csvToList(programmingLanguages.text),
    tools: _csvToList(tools.text),
    otherSkills: _csvToList(otherSkills.text),
  );
}

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({super.key});

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  late ThemeData theme;
  late ResumeflowLocalizations l10n;

  final _formKeys = List<GlobalKey<FormState>>.generate(
    _formPagesLength,
    (_) => GlobalKey<FormState>(),
  );

  GlobalKey<FormState> get _curFormKey => _formKeys[_formPageIndex];

  late PdfControllerPinch pdfController;
  var validatedBefore = false;
  bool _loadingPdf = false;

  final TextEditingController _applicantNameController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();

  final List<EduControllers> _educationControllers = [EduControllers()];
  final List<ProjControllers> _projectControllers = [ProjControllers()];
  final List<ExpControllers> _experienceControllers = [ExpControllers()];
  final SkillsControllers _skillsControllers = SkillsControllers();

  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _applicantTitleController =
      TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _achievementsController = TextEditingController();
  final TextEditingController _softSkillsController = TextEditingController();

  late bool _compactView;
  late bool pdfPreview;
  BuildContext? _compactPdfPreviewContext;
  var _formPageIndex = 0;
  static const int _formPagesLength = 5;
  Uint8List? _pdfData;
  bool _dirty = false;

  @override
  void dispose() {
    _applicantNameController.dispose();
    _addressController.dispose();
    _telephoneController.dispose();
    _emailController.dispose();
    _degreeController.dispose();
    _applicantTitleController.dispose();
    _experienceController.dispose();
    _softSkillsController.dispose();
    pdfController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pdfController = PdfControllerPinch(
      document: PdfDocument.openData(PdfUtil.buildEmptyPage()),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
    _compactView = context.platformHelper.isCompact;
    pdfPreview = context.watch<SettingsRepository>().previewResumeLO.object;
    if (!_compactView && _compactPdfPreviewContext != null) {
      Navigator.of(_compactPdfPreviewContext!).pop();
      _compactPdfPreviewContext = null;
    }
    l10n = ResumeflowLocalizations.of(context);
    if (validatedBefore) {
      _curFormKey.currentState?.validate();
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
      floatingActionButton:
          !pdfPreview
              ? null
              : FloatingActionButton(
                onPressed: () async {
                  final model = await _generateDocumentModel();
                  _pdfData = await PkService.pkResume(model);
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
                                      document: PdfDocument.openData(_pdfData!),
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
                  if (pdfPreview) ...[
                    ConstrainedBox(
                      constraints: BoxConstraints.loose(Size(5, 1200)),
                      child: VerticalDivider(indent: 10, endIndent: 10),
                    ),
                    Flexible(child: _buildPdfPreview()),
                  ],
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
            children: [
              Row(
                children: [
                  if (_formPageIndex != 0) _buildBackButton(),
                  Spacer(),
                  _formPageIndex == _formPagesLength - 1
                      ? _buildPdfDownlaodBtn()
                      : _buildNextButton(),
                ],
              ),
              IndexedStack(
                index: _formPageIndex,
                children: [
                  _buildInfoFormPage(),
                  _buildEduFormPage(),
                  _buildProjectFormPage(),
                  _buildExpFormPage(),
                  _buildSkillsInfoFormPage(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            _loadingPdf
                ? Colors.grey.withAlpha(150)
                : theme.colorScheme.primary.withAlpha(200),
      ),
      onPressed:
          _loadingPdf
              ? null
              : () async {
                if (!_curFormKey.currentState!.validate()) {
                  validatedBefore = true;
                  return;
                }

                if (!_compactView && pdfPreview && _dirty) {
                  setState(() {
                    _loadingPdf = true;
                  });

                  try {
                    _pdfData = await PkService.pkResume(
                      await _generateDocumentModel(),
                    );
                    await _reloadPdfPreview(_pdfData);
                  } on PkServiceException catch (exception) {
                    if (!mounted) return;
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(_buildErrorSnackBar(exception));
                  }
                }
                setState(() {
                  ++_formPageIndex;
                  _loadingPdf = false;
                  validatedBefore = false;
                  _dirty = false;
                });
              },
      child: Row(
        spacing: 10,
        children: [
          if (_loadingPdf)
            CircularProgressIndicator(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints.tight(Size(15, 15)),
            ),
          Text(l10n.next, style: TextStyle(color: Colors.white)),
          Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary.withAlpha(200),
      ),
      onPressed:
          () => setState(() {
            --_formPageIndex;
          }),
      child: Row(
        spacing: 10,
        children: [
          Icon(Icons.arrow_back, color: Colors.white),
          Text(l10n.previous, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildFormTextField({
    required String fieldName,
    required TextEditingController controller,
    TextInputType? keyboardType,
    int lines = 1,
    bool canBeEmpty = false,
    String? tooltip,
    String? example,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 5,
          children: [
            SizedBox(width: 5),
            Text(fieldName, style: theme.textTheme.titleMedium),
            if (tooltip != null)
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
          onChanged: (_) {
            _dirty = true;
            if (validatedBefore) {
              _curFormKey.currentState!.validate();
            }
          },
          keyboardType: keyboardType,
          validator:
              canBeEmpty
                  ? null
                  : (value) => value!.isEmpty ? l10n.empytFieldError : null,
          decoration: InputDecoration(
            hintText: example,
            alignLabelWithHint: true,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withAlpha(75),
            ),

            filled: true,
            fillColor: theme.colorScheme.onPrimary.withAlpha(125),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: theme.colorScheme.onSurface.withAlpha(200),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: theme.colorScheme.secondary),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _reloadPdfPreview(Uint8List? data) async {
    await pdfController.loadDocument(PdfDocument.openData(data ?? _pdfData!));
  }

  Future<PkResumeModel> _generateDocumentModel() async {
    final summary = await PkService.pkSummary(
      title: _applicantNameController.text,
      yearsExp: _experienceController.text,
      skills: _skillsControllers.tools.text,
      achievements: _achievementsController.text,
    );

    final projSummaries = await Future.wait(
      _projectControllers.map(
        (proj) => PkService.pkProjectSummary(
          name: proj.name.text,
          description: proj.description.text,
          skills: proj.skills.text,
        ),
      ),
    );

    for (int i = 0; i < projSummaries.length; ++i) {
      _projectControllers[i].description.text = projSummaries[i];
    }

    final resumeModel = PkResumeModel(
      information: PkInformation(
        phone: _telephoneController.text,
        name: _applicantNameController.text,
        address: _addressController.text,
        email: _emailController.text,
        github: _githubController.text,
        linkedin: _linkedinController.text,
        summary: summary,
      ),
      education:
          _educationControllers
              .where((element) => !element.isEmpty)
              .map((e) => e.data)
              .toList(),
      projects:
          _projectControllers
              .where((element) => !element.isEmpty)
              .map((e) => e.data)
              .toList(),
      experience:
          _experienceControllers
              .where((element) => !element.isEmpty)
              .map((e) => e.data)
              .toList(),
      technicalSkills: _skillsControllers.data,
      softSkills: _csvToList(_softSkillsController.text),
    );

    return resumeModel;
  }

  Widget _buildPdfDownlaodBtn() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          _loadingPdf ? Colors.grey.shade800 : theme.colorScheme.secondary,
        ),
      ),
      onPressed: _loadingPdf ? null : _downloadResumeAsPdf,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          if (_loadingPdf)
            CircularProgressIndicator(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints.tight(Size(15, 15)),
            ),
          Text(
            l10n.exportToPdf,
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  void _downloadResumeAsPdf() async {
    validatedBefore = true;
    if (!_curFormKey.currentState!.validate()) return;

    setState(() {
      _loadingPdf = true;
    });

    try {
      final resume = await _generateDocumentModel();
      final bytes = await PkService.pkResume(resume);
      await _exportToPdf(bytes);
      _reloadPdfPreview(bytes);
    } on PkServiceException catch (exception) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(_buildErrorSnackBar(exception));
      }
    } finally {
      setState(() {
        _loadingPdf = false;
      });
    }
  }

  SnackBar _buildErrorSnackBar(PkServiceException exception) {
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

  Future<void> _exportToPdf(Uint8List bytes) async {
    await FileSaver.saveAs(
      bytes,
      fileName: '${_applicantNameController.text}.pdf',
      prompt: l10n.chooseDownloadDir,
    );
  }

  Widget _buildFormPageLabel(String label) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Text(label, style: theme.textTheme.displaySmall!),
    );
  }

  Widget _buildInfoFormPage() {
    return Form(
      key: _formKeys[0],
      child: Column(
        spacing: 10,
        children: [
          _buildFormPageLabel(l10n.personalInfo),
          _buildFormTextField(
            fieldName: l10n.applicantName,
            controller: _applicantNameController,
            tooltip: l10n.applicantNameTooltip,
            example: l10n.applicantDegreeExample,
          ),
          _buildFormTextField(
            fieldName: l10n.address,
            controller: _addressController,
            tooltip: l10n.addressTooltip,
            example: l10n.addressExample,
          ),
          _buildFormTextField(
            fieldName: l10n.email,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            tooltip: l10n.emailTooltip,
            example: l10n.emailExample,
          ),
          _buildFormTextField(
            fieldName: l10n.telephone,
            controller: _telephoneController,
            keyboardType: TextInputType.phone,
            tooltip: l10n.telephoneTooltip,
            example: l10n.telephoneExample,
          ),
          _buildFormTextField(
            fieldName: l10n.applicantTitle,
            controller: _applicantTitleController,
            tooltip: l10n.applicantTitleTooltip,
            example: l10n.applicantTitleExample,
          ),
          _buildFormTextField(
            fieldName: l10n.achievements,
            controller: _achievementsController,
            tooltip: l10n.achievementsTooltip,
            example: l10n.achievementsExample,
            lines: 2,
          ),
          _buildFormTextField(
            fieldName: l10n.experience,
            controller: _experienceController,
            tooltip: l10n.experienceTooltip,
            example: l10n.experienceExample,
            lines: 3,
          ),
          _buildFormTextField(
            fieldName: l10n.github,
            controller: _githubController,
            keyboardType: TextInputType.url,
            tooltip: l10n.githubTooltip,
            example: l10n.githubExample,
            canBeEmpty: true,
          ),
          _buildFormTextField(
            fieldName: l10n.linkedin,
            controller: _linkedinController,
            keyboardType: TextInputType.url,
            tooltip: l10n.linkedinTooltip,
            example: l10n.linkedinExample,
            canBeEmpty: true,
          ),
        ],
      ),
    );
  }

  Widget _buildEduFormPage() {
    return Form(
      key: _formKeys[1],
      child: Column(
        spacing: 10,
        children: [
          _buildFormPageLabel(l10n.education),
          for (final expControllers in _educationControllers)
            Column(
              spacing: 10,
              children: [
                _buildFormTextField(
                  fieldName: l10n.degree,
                  controller: expControllers.degree,
                  tooltip: l10n.degreeTooltip,
                  example: l10n.degreeExample,
                ),
                _buildFormTextField(
                  fieldName: l10n.institution,
                  controller: expControllers.school,
                  tooltip: l10n.institutionTooltip,
                  example: l10n.institutionExample,
                ),
                _buildFormTextField(
                  fieldName: l10n.location,
                  controller: expControllers.location,
                  tooltip: l10n.locationTooltip,
                  example: l10n.locationExample,
                ),
                _buildFormTextField(
                  fieldName: l10n.startDate,
                  controller: expControllers.startDate,
                  tooltip: l10n.startDateTooltip,
                  example: l10n.startDateExample,
                  keyboardType: TextInputType.datetime,
                ),
                _buildFormTextField(
                  fieldName: l10n.endDate,
                  controller: expControllers.endDate,
                  tooltip: l10n.endDateTooltip,
                  example: l10n.endDateExample,
                  keyboardType: TextInputType.datetime,
                ),
                _buildFormTextField(
                  fieldName: l10n.grade,
                  controller: expControllers.gpa,
                  tooltip: l10n.gradeTooltip,
                  example: l10n.gradeExample,
                  keyboardType: TextInputType.number,
                ),
                Divider(indent: 20, endIndent: 20),
              ],
            ),
          IconButton(
            onPressed:
                () => setState(() {
                  _educationControllers.add(EduControllers());
                }),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectFormPage() {
    return Form(
      key: _formKeys[2],
      child: Column(
        spacing: 10,
        children: [
          _buildFormPageLabel(l10n.projects),
          for (final projControllers in _projectControllers)
            Column(
              spacing: 10,
              children: [
                _buildFormTextField(
                  fieldName: l10n.projectName,
                  controller: projControllers.name,
                  tooltip: l10n.projectNameTooltip,
                  example: l10n.projectNameExample,
                ),
                _buildFormTextField(
                  fieldName: l10n.description,
                  controller: projControllers.description,
                  tooltip: l10n.projectDescriptionTooltip,
                  example: l10n.projectDescriptionExample,
                  keyboardType: TextInputType.multiline,
                  lines: 2,
                ),
                _buildFormTextField(
                  fieldName: l10n.endDate,
                  controller: projControllers.endDate,
                  tooltip: l10n.endDateTooltip,
                  example: l10n.endDateExample,
                  keyboardType: TextInputType.datetime,
                ),
                _buildFormTextField(
                  fieldName: l10n.skills,
                  controller: projControllers.skills,
                  tooltip: l10n.skillsTooltip,
                  example: l10n.skillsExample,
                  lines: 3,
                ),
                Divider(indent: 20, endIndent: 20),
              ],
            ),
          IconButton(
            onPressed:
                () => setState(() {
                  _projectControllers.add(ProjControllers());
                }),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _buildExpFormPage() {
    return Form(
      key: _formKeys[3],
      child: Column(
        spacing: 10,
        children: [
          _buildFormPageLabel(l10n.experience),
          for (final expControllers in _experienceControllers)
            Column(
              spacing: 10,
              children: [
                _buildFormTextField(
                  fieldName: l10n.companyName,
                  controller: expControllers.company,
                  tooltip: l10n.companyNameTooltip,
                  example: l10n.companyNameExample,
                  keyboardType: TextInputType.name,
                ),
                _buildFormTextField(
                  fieldName: l10n.applicantTitle,
                  controller: expControllers.title,
                  tooltip: l10n.applicantTitleTooltip,
                  example: l10n.applicantTitleExample,
                  keyboardType: TextInputType.name,
                ),
                _buildFormTextField(
                  fieldName: l10n.description,
                  controller: expControllers.description,
                  tooltip: l10n.experience,
                  example: l10n.experienceTooltip,
                  lines: 2,
                ),
                _buildFormTextField(
                  fieldName: l10n.startDate,
                  controller: expControllers.startDate,
                  tooltip: l10n.startDateTooltip,
                  example: l10n.startDateExample,
                  keyboardType: TextInputType.datetime,
                ),
                _buildFormTextField(
                  fieldName: l10n.endDate,
                  controller: expControllers.endDate,
                  tooltip: l10n.endDateTooltip,
                  example: l10n.endDateExample,
                  keyboardType: TextInputType.datetime,
                ),

                Divider(indent: 20, endIndent: 20),
              ],
            ),
          IconButton(
            onPressed:
                () => setState(() {
                  _experienceControllers.add(ExpControllers());
                }),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsInfoFormPage() {
    return Form(
      key: _formKeys[4],
      child: Column(
        spacing: 10,
        children: [
          _buildFormPageLabel(l10n.skills),
          _buildFormTextField(
            fieldName: l10n.programmingLanguages,
            controller: _skillsControllers.programmingLanguages,
            tooltip: l10n.programmingLanguagesTooltip,
            example: l10n.programmingLanguagesExample,
            keyboardType: TextInputType.text,
          ),
          _buildFormTextField(
            fieldName: l10n.tools,
            controller: _skillsControllers.tools,
            tooltip: l10n.toolsTooltip,
            example: l10n.toolsExample,
            keyboardType: TextInputType.text,
          ),
          _buildFormTextField(
            fieldName: l10n.softSkills,
            controller: _softSkillsController,
            tooltip: l10n.softSkillsTooltip,
            example: l10n.softSkillsExample,
          ),
          _buildFormTextField(
            fieldName: l10n.otherSkills,
            controller: _skillsControllers.otherSkills,
            tooltip: l10n.otherSkillsTooltip,
            example: l10n.otherSkillsExample,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
