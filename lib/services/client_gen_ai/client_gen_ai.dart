import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:resumeflow/models/cover_letter_models/cover_letter_models.dart';
import 'package:resumeflow/models/gen_ai_service_interfaces/gen_ai_service_interface.dart';
import 'package:resumeflow/services/client_gen_ai/client_cover_letter_gen_service/client_cover_letter_gen_service.dart';

class ClientGenAi implements GenAiServiceInterface {
  const ClientGenAi();

  static final GenerativeModel model = GenerativeModel(
    model: 'gemini-2.0-flash-exp',
    apiKey: const String.fromEnvironment('GEMINI_API_KEY'),
  );

  @override
  Future<CoverLetterGenData> genCoverLetter(
          CoverLetterRequestModel coverLetter) =>
      ClientCoverLetterGenService(model).genData(coverLetter);
}
