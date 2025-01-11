import 'package:json_annotation/json_annotation.dart';

part 'coverletter_request_model.g.dart';

@JsonSerializable()
class CoverletterRequestModel {
  final String jobPost;
  final String userName;
  final String userDegree;
  final String userTitle;
  final String userExperience;
  final String userSkills;

  CoverletterRequestModel({
    required this.jobPost,
    required this.userName,
    required this.userDegree,
    required this.userTitle,
    required this.userExperience,
    required this.userSkills,
  });

  factory CoverletterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CoverletterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoverletterRequestModelToJson(this);
}
