import 'package:resumeflow/models/cover_letter_models/cover_letter_data.dart';
import 'package:resumeflow/models/cover_letter_models/cover_letter_generative_data.dart';

class CoverLetterModel {
  // Recipient-related
  final String recipientName;

  // Applicant-related
  final String applicantName;
  final String applicantAddress;
  final String applicantTelephone;
  final String applicantEmail;

  // Generative data
  final String genBody;

  CoverLetterModel({
    required CoverLetterData data,
    required CoverLetterGenerativeData genData,
  })  : recipientName = data.recipientName,
        applicantName = data.applicantName,
        applicantAddress = data.applicantAddress,
        applicantTelephone = data.applicantTelephone,
        applicantEmail = data.applicantEmail,
        genBody = genData.genBody;
}
