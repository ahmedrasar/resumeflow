import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:resumeflow/models/coverletter_models/coverletter_models.dart';
import 'package:resumeflow/services/coverletter_gen_service/coverletter_gen_service.dart';
import 'package:resumeflow/ui/widgets/grid_background.dart';

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
  final TextEditingController _recipientJobPostController =
      TextEditingController();

  // Applicant Controllers
  final TextEditingController _applicantNameController =
      TextEditingController();
  final TextEditingController _applicantAddressController =
      TextEditingController();
  final TextEditingController _applicantTelephoneController =
      TextEditingController();
  final TextEditingController _applicantEmailController =
      TextEditingController();

  final TextEditingController _applicantDegreeController =
      TextEditingController();

  final TextEditingController _applicantTitleController =
      TextEditingController();

  final TextEditingController _applicantExperienceController =
      TextEditingController();

  final TextEditingController _applicantSkillsController =
      TextEditingController();

  Widget _buildTextField(
      {required String hint, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment(-0.9, 0),
            child: Text(
              hint,
              style: Theme.of(context).textTheme.titleMedium,
            )),
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
              hint: l10n.recipientName, controller: _applicantNameController),
          _buildTextField(
              hint: l10n.recipientJobPost,
              controller: _recipientJobPostController),
          _buildTextField(
              hint: l10n.recipientName, controller: _recipientNameController),
          _buildTextField(
              hint: l10n.applicantDegree,
              controller: _applicantDegreeController),
          _buildTextField(
              hint: l10n.applicantTitle, controller: _applicantTitleController),
          _buildTextField(
              hint: l10n.applicantExperience,
              controller: _applicantExperienceController),
          _buildTextField(
              hint: l10n.applicantSkills,
              controller: _applicantSkillsController),
          _buildTextField(
              hint: l10n.applicantAddress,
              controller: _applicantAddressController),
          _buildTextField(
              hint: l10n.applicantTelephone,
              controller: _applicantTelephoneController),
          _buildTextField(
              hint: l10n.applicantEmail, controller: _applicantEmailController),
        ],
      ),
    );
  }

  Future<CoverletterModel?> __generateCoverletter() async {
    if (!_formKey.currentState!.validate()) return null;

    final data = CoverletterData(
        recipientName: _applicantNameController.text,
        recipientJobPost: _recipientJobPostController.text,
        applicantName: _applicantNameController.text,
        applicantAddress: _applicantAddressController.text,
        applicantTelephone: _applicantTelephoneController.text,
        applicantEmail: _applicantEmailController.text,
        applicantDegree: _applicantDegreeController.text,
        applicantTitle: _applicantTitleController.text,
        applicantExperience: _applicantExperienceController.text,
        applicantSkills: _applicantSkillsController.text);

    final service = CoverletterGenerationService(http.Client());
    final genData =
        await service.generateData(CoverletterRequestModel(data: data));

    if (genData == null) return null;

    return CoverletterModel(data: data, genData: genData);
  }

  Widget _bulildSummitBtn() {
    return ElevatedButton(
        style: ButtonStyle(
            fixedSize: WidgetStatePropertyAll(Size(200, 50)),
            backgroundColor:
                WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
            foregroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.onPrimary)),
        onPressed: () async {
          validatedBefore = true;
          final coverletter = await __generateCoverletter();
          if (!mounted) return;
          final l10n = ResumeflowLocalizations.of(context);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                coverletter == null ? l10n.errorMessage : coverletter.genBody,
              ),
            ),
          );
        },
        child: Text(ResumeflowLocalizations.of(context).createCoverletterBtn));
  }
}
