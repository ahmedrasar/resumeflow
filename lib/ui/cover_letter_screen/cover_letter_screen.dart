import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/models/cover_letter_models/cover_letter_models.dart';
import 'package:resumeflow/services/cover_letter_gen_service/cover_letter_gen_service.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';
import 'package:flutter/services.dart';
import 'package:resumeflow/utils/file_saver/file_saver.dart';

class CoverLetterScreen extends StatefulWidget {
  const CoverLetterScreen({super.key});

  @override
  State<CoverLetterScreen> createState() => _CoverLetterScreenState();
}

class _CoverLetterScreenState extends State<CoverLetterScreen> {
  final _formKey = GlobalKey<FormState>();

  var validatedBefore = false;

  // Recipient Controllers
  final TextEditingController _recipientNameController =
      TextEditingController();
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
    required String hint,
    required String tooltip,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 5,
          children: [
            Align(
              alignment: Alignment(-0.9, 0),
              child: Text(
                hint,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Tooltip(
              message: tooltip,
              child: Icon(
                Icons.info_outline_rounded,
                size: 15,
                color: Theme.of(context).iconTheme.color?.withAlpha(150),
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
          validator: (value) => value!.isEmpty
              ? ResumeflowLocalizations.of(context).empytFieldError
              : null,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.color
                    ?.withAlpha(100)),
            filled: true,
            fillColor: Theme.of(context).colorScheme.onPrimary.withAlpha(125),
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
    return Scaffold(
      body: GridBackground(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Material(
                color: Theme.of(context).colorScheme.surface.withAlpha(225),
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
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
        ),
      ),
    );
  }

  Form _buildForm() {
    final l10n = ResumeflowLocalizations.of(context);

    return Form(
      key: _formKey,
      child: Column(
        spacing: 20,
        children: [
          _buildTextField(
              hint: l10n.companyName,
              tooltip: l10n.recipientNameTooltip,
              controller: _recipientNameController),
          _buildTextField(
              hint: l10n.jobPost,
              tooltip: l10n.jobPost,
              controller: _jobPostController),
          _buildTextField(
              hint: l10n.applicantName,
              tooltip: l10n.applicantNameTooltip,
              controller: _applicantNameController),
          _buildTextField(
              hint: l10n.applicantDegree,
              tooltip: l10n.applicantDegreeTooltip,
              controller: _degreeController),
          _buildTextField(
              hint: l10n.applicantTitle,
              tooltip: l10n.applicantTitleTooltip,
              controller: _applicantTitleController),
          _buildTextField(
              hint: l10n.experience,
              tooltip: l10n.experienceTooltip,
              controller: _experienceController),
          _buildTextField(
              hint: l10n.skills,
              tooltip: l10n.skillsTooltip,
              controller: _skillsController),
          _buildTextField(
              hint: l10n.address,
              tooltip: l10n.addressTooltip,
              controller: _addressController),
          _buildTextField(
              hint: l10n.telephone,
              tooltip: l10n.telephoneTooltip,
              controller: _telephoneController),
          _buildTextField(
              hint: l10n.email,
              tooltip: l10n.emailTooltip,
              controller: _emailController),
        ],
      ),
    );
  }

  Future<CoverLetterModel?> __generateCoverletter() async {
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

    if (genData == null) return null;

    return CoverLetterModel(data: data, genData: genData);
  }

  Widget _bulildSummitBtn() {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(200, 50)),
        maximumSize: WidgetStatePropertyAll(Size(225, 50)),
        backgroundColor: WidgetStatePropertyAll(_loading
            ? Colors.grey.shade800
            : Theme.of(context).colorScheme.secondary),
      ),
      onPressed: _loading
          ? null
          : () async {
              validatedBefore = true;
              if (!_formKey.currentState!.validate()) return;

              setState(() {
                _loading = true;
              });

              final coverletter = await __generateCoverletter();
              if (!mounted) return;
              final l10n = ResumeflowLocalizations.of(context);
              if (coverletter == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(l10n.unexpectedError),
                    elevation: 10,
                    backgroundColor: Theme.of(context).colorScheme.error));
              } else {
                await showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(l10n.coverLetter),
                            Wrap(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    await Clipboard.setData(ClipboardData(
                                        text: coverletter.generatedBody));
                                  },
                                  tooltip: l10n.copy,
                                  icon: Icon(Icons.copy),
                                ),
                                FilledButton(
                                  onPressed: () async {
                                    await FileSaver.saveCoverLetter(coverletter,
                                        prompt: l10n.chooseDownloadDir);
                                  },
                                  child: Text(l10n.exportToDocx),
                                ),
                              ],
                            ),
                          ],
                        ),
                        content: ConstrainedBox(
                          constraints: BoxConstraints.loose(Size(600, 1200)),
                          child: Card.filled(
                            color: Theme.of(context).colorScheme.surface,
                            margin: EdgeInsets.all(10),
                            child: SelectableText(
                              coverletter.generatedBody,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(l10n.close),
                          ),
                        ],
                      );
                    });
              }

              setState(() {
                _loading = false;
              });
            },
      child: _loading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ResumeflowLocalizations.of(context).createCoverLetter,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ),
                CircularProgressIndicator(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints.tight(Size(15, 15)),
                ),
              ],
            )
          : Text(
              ResumeflowLocalizations.of(context).createCoverLetter,
              style: Theme.of(context).textTheme.titleMedium,
            ),
    );
  }
}
