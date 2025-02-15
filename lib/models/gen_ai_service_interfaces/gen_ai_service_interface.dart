import 'package:resumeflow/models/cover_letter_models/cover_letter_models.dart';

abstract interface class GenAiServiceInterface {
  const GenAiServiceInterface();

  Future<CoverLetterGenData> genCoverLetter(
      CoverLetterRequestModel coverLetter);
}
