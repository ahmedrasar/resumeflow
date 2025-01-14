import 'package:resumeflow/models/coverletter_models/coverletter_data.dart';
import 'package:resumeflow/models/coverletter_models/coverletter_generative_data.dart';

class CoverletterModel {
  // Recipient-related
  final String recipientName;

  // Applicant-related
  final String applicantName;
  final String applicantAddress;
  final String applicantTelephone;
  final String applicantEmail;

  // Generative data
  final String genBody;

  CoverletterModel({
    required CoverletterData data,
    required CoverletterGenerativeData genData,
  })  : recipientName = data.recipientName,
        applicantName = data.applicantName,
        applicantAddress = data.applicantAddress,
        applicantTelephone = data.applicantTelephone,
        applicantEmail = data.applicantEmail,
        genBody = genData.genBody;
}
