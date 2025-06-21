import 'dart:developer';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:resumeflow/models/document_models/cover_letter_models/cover_letter_models.dart';
import 'package:resumeflow/models/document_models/resume_models/resume_gen_data.dart';
import 'package:resumeflow/models/gen_ai_service/gen_ai_service.dart';
import 'package:resumeflow/services/gemini_service/gemini_cover_letter_gen_service.dart';
import 'package:resumeflow/services/gemini_service/gemini_resume_gen_service.dart';
import 'package:resumeflow/utils/gemini_models_enum/gemini_models_enum.dart';

class GeminiService extends GenAiService {
  static final _geminiKey = const String.fromEnvironment('GEMINI_API_KEY');
  // TODO: You exceeded your current quota, please check your plan and billing details.
  //For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits.
  static GenerativeModel? _genModel;

  static set model(GeminiModelsEnum model) {
    _genModel = GenerativeModel(model: model.modelCode, apiKey: _geminiKey);
  }

  static GenerativeModel get genModel => _genModel!;

  GeminiService(super.acquiredData, super.l10n);

  @override
  Future<CoverLetterGenData?> genCoverLetter() async =>
      await GeminiCoverLetterGenService(l10n, genModel).genData(acquiredData);

  @override
  Future<ResumeGenData?> genResume() async {
    return await GeminiResumeGenService(l10n, genModel).genData(acquiredData);
  }
}
