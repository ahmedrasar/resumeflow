import 'package:resumeflow/models/cover_letter_models/cover_letter_generative_data.dart';
import 'package:resumeflow/models/cover_letter_models/cover_letter_request_model.dart';

abstract interface class CoverLetterGenServiceInterface {
  Future<CoverLetterGenData> genData(CoverLetterRequestModel cl);
}
