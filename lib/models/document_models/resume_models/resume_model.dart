import 'package:resumeflow/models/document_models/interfaces/acquired_data.dart';
import 'package:resumeflow/models/document_models/interfaces/document_model.dart';
import 'package:resumeflow/models/document_models/resume_models/resume_gen_data.dart';

class ResumeModel extends DocumentModel {
  // Recipient-related
  final String companyName;

  // Applicant-related
  final String name;
  final String address;
  final String telephone;
  final String email;

  // Generative data
  final List<String> skills;
  final List<String> experience;

  ResumeModel({
    required this.companyName,
    required this.name,
    required this.address,
    required this.telephone,
    required this.email,
    required this.skills,
    required this.experience,
  });

  ResumeModel.fromData({
    required AcquiredData data,
    required ResumeGenData? genData,
  }) : companyName = data.companyName,
       name = data.name,
       address = data.address,
       telephone = data.telephone,
       email = data.email,
       skills = genData?.skills ?? [],
       experience = genData?.experience ?? [];

  ResumeModel copyWith({
    String? companyName,
    String? name,
    String? address,
    String? telephone,
    String? email,
    List<String>? skills,
    List<String>? experience,
  }) {
    return ResumeModel(
      companyName: companyName ?? this.companyName,
      name: name ?? this.name,
      address: address ?? this.address,
      telephone: telephone ?? this.telephone,
      email: email ?? this.email,
      skills: skills ?? this.skills,
      experience: experience ?? this.experience,
    );
  }
}
