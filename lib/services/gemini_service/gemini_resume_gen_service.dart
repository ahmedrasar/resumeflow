import 'dart:convert';
import 'dart:developer';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:resumeflow/models/document_models/document_models.dart';
import 'package:resumeflow/models/gen_ai_service/gen_ai_service.dart';
import 'package:resumeflow/models/gen_ai_service/gen_data_service.dart';
import 'package:resumeflow/utils/json_util/json_util.dart';

class GeminiResumeGenService extends ResumeDataGenService {
  static final _prompt = Content.text('''
Craft a professional resume using the provided job posting and candidate data.
Focus solely on the essential content, eliminating any placeholder or template-style headers like addresses or contact information.

Candidate Profile Will be provided as JSON Later.

Response:
- The response must be pure josn with the following schema:
  {
      "skills": ["skill-1", "skill-2"],
      "experience": ["exp-1", "exp-2"]
  }
- No ```json``` markdown annotations in the response
- Skills and experence fields are a list of strings
  that represents points from the candidate date that relates or could be in a benefiet for the job.


Specific Requirements:
- Use a professional, confident tone
- Focus on technical achievements
- Avoid generic statements
- Use numerals for all numbers (e.g., "5 years", "40% improvement") - never spell out numbers

Emphasize:
- Specific technologies from the job posting
- Practical experience
- Measurable impacts (always in numeral form)
- Alignment with job requirements

Generate a concise, impactful resume that goes straight to the professional content, using the provided candidate data throughout.
''');

  final GenerativeModel _model;

  const GeminiResumeGenService(super.l10n, GenerativeModel model)
    : _model = model;

  @override
  Future<ResumeGenData> genDataWhenComplete(AcquiredData acquiredData) async {
    final prompt = [_prompt, Content.text(acquiredData.toJson().toString())];
    try {
      final response = await _model.generateContent(
        prompt,
        generationConfig: GenerationConfig(),
      );
      Map<String, dynamic> jsonMap = json.decode(
        JsonUtil.trimCodeAnnotations(response.text!),
      );
      final {
        'skills': List<dynamic> skills,
        'experience': List<dynamic> experience,
      } = jsonMap;
      return ResumeGenData(
        skills: skills.cast<String>(),
        experience: experience.cast<String>(),
      );
    } catch (e) {
      log(e.toString());
      throw GenAiException(-1, l10n.genAiUnkownError);
    }
  }

  @override
  bool isCompleteData(AcquiredData acquiredData) => [
    acquiredData.name,
    acquiredData.skills,
    acquiredData.experience,
    acquiredData.jobPost,
  ].every((field) => field.isNotEmpty);
}
