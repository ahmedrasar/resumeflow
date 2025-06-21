import 'package:resumeflow/models/document_models/cover_letter_models/cover_letter_gen_data.dart';
import 'package:resumeflow/models/document_models/interfaces/acquired_data.dart';
import 'package:resumeflow/models/document_models/interfaces/document_model.dart';

class CoverLetterModel extends DocumentModel {
  // Recipient-related
  final String companyName;

  // Applicant-related
  final String name;
  final String address;
  final String telephone;
  final String email;

  // Generative data
  final String body;

  const CoverLetterModel({
    required this.companyName,
    required this.name,
    required this.address,
    required this.telephone,
    required this.email,
    required this.body,
  });

  CoverLetterModel.fromData({
    required AcquiredData data,
    required CoverLetterGenData? genData,
  }) : companyName = data.companyName,
       name = data.name,
       address = data.address,
       telephone = data.telephone,
       email = data.email,
       body = genData?.body ?? '';

  CoverLetterModel copyWith({
    String? companyName,
    String? name,
    String? address,
    String? telephone,
    String? email,
    String? body,
  }) {
    return CoverLetterModel(
      companyName: companyName ?? this.companyName,
      name: name ?? this.name,
      address: address ?? this.address,
      telephone: telephone ?? this.telephone,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }
}
