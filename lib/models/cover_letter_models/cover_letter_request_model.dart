import 'package:json_annotation/json_annotation.dart';
import 'package:resumeflow/models/cover_letter_models/cover_letter_data.dart';

part 'cover_letter_request_model.g.dart';

@JsonSerializable(createFactory: false)
class CoverLetterRequestModel {
  // Recipent-related
  @JsonKey(name: 'job_post')
  final String jobPost;

  // Applicant-related
  @JsonKey(name: 'user_name')
  final String name;
  @JsonKey(name: 'user_degree')
  final String degree;
  @JsonKey(name: 'user_title')
  final String title;
  @JsonKey(name: 'user_experience')
  final String experience;
  @JsonKey(name: 'user_skills')
  final String skills;

  CoverLetterRequestModel({
    required CoverLetterData data,
  })  : jobPost = data.jobPost,
        name = data.name,
        degree = data.degree,
        title = data.title,
        experience = data.experience,
        skills = data.skills;

  Map<String, dynamic> toJson() => _$CoverLetterRequestModelToJson(this);
}
