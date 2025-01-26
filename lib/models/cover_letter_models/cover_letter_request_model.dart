import 'package:json_annotation/json_annotation.dart';
import 'package:resumeflow/models/cover_letter_models/cover_letter_data.dart';

part 'cover_letter_request_model.g.dart';

@JsonSerializable(createFactory: false)
class CoverLetterRequestModel {
  // Recipent-related
  @JsonKey(name: 'job_post')
  final String recipientJobPost;

  // Applicant-related
  @JsonKey(name: 'user_name')
  final String applicantName;
  @JsonKey(name: 'user_degree')
  final String applicantDegree;
  @JsonKey(name: 'user_title')
  final String applicantTitle;
  @JsonKey(name: 'user_experience')
  final String applicantExperience;
  @JsonKey(name: 'user_skills')
  final String applicantSkills;

  CoverLetterRequestModel({
    required CoverLetterData data,
  })  : recipientJobPost = data.recipientJobPost,
        applicantName = data.applicantName,
        applicantDegree = data.applicantDegree,
        applicantTitle = data.applicantTitle,
        applicantExperience = data.applicantExperience,
        applicantSkills = data.applicantSkills;

  Map<String, dynamic> toJson() => _$CoverLetterRequestModelToJson(this);
}
