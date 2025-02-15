import 'package:resumeflow/models/cover_letter_models/cover_letter_data.dart';
import 'package:resumeflow/models/cover_letter_models/cover_letter_generative_data.dart';

class CoverLetterModel {
  // Recipient-related
  final String comapnyName;

  // Applicant-related
  final String name;
  final String address;
  final String telephone;
  final String email;

  // Generative data
  final String generatedBody;

  CoverLetterModel({
    required CoverLetterData data,
    required CoverLetterGenData genData,
  })  : comapnyName = data.companyName,
        name = data.name,
        address = data.address,
        telephone = data.telephone,
        email = data.email,
        generatedBody = genData.generatedBody;
}
