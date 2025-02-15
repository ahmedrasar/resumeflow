import 'package:http/http.dart' as http;
import 'package:resumeflow/models/cover_letter_models/cover_letter_models.dart';
import 'package:resumeflow/models/gen_ai_service_interfaces/gen_ai_service_interface.dart';
import 'package:resumeflow/services/server_gen_ai/server_cover_letter_gen_service/server_cover_letter_gen_service.dart';

class ServerGenAi implements GenAiServiceInterface {
  const ServerGenAi();

  @override
  Future<CoverLetterGenData> genCoverLetter(
          CoverLetterRequestModel coverLetter) =>
      ServerCoverLetterGenService(http.Client()).genData(coverLetter);
}
