import 'package:resumeflow/models/cover_letter_models/cover_letter_data.dart';
import 'package:resumeflow/models/cover_letter_models/cover_letter_generative_data.dart';

class CoverLetterModel {
  // Recipient-related
  final String companyName;

  // Applicant-related
  final String name;
  final String address;
  final String telephone;
  final String email;

  // Generative data
  final String generatedBody;

  const CoverLetterModel({
    required this.companyName,
    required this.name,
    required this.address,
    required this.telephone,
    required this.email,
    required this.generatedBody,
  });

  CoverLetterModel.fromData({
    required CoverLetterData data,
    required CoverLetterGenData genData,
  })  : companyName = data.companyName,
        name = data.name,
        address = data.address,
        telephone = data.telephone,
        email = data.email,
        generatedBody = genData.generatedBody;

  CoverLetterModel copyWith({
    String? companyName,
    String? name,
    String? address,
    String? telephone,
    String? email,
    String? generatedBody,
  }) {
    return CoverLetterModel(
      companyName: companyName ?? this.companyName,
      name: name ?? this.name,
      address: address ?? this.address,
      telephone: telephone ?? this.telephone,
      email: email ?? this.email,
      generatedBody: generatedBody ?? this.generatedBody,
    );
  }
}
