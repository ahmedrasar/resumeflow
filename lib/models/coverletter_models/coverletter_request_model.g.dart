// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coverletter_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoverletterRequestModel _$CoverletterRequestModelFromJson(
        Map<String, dynamic> json) =>
    CoverletterRequestModel(
      jobPost: json['jobPost'] as String,
      userName: json['userName'] as String,
      userDegree: json['userDegree'] as String,
      userTitle: json['userTitle'] as String,
      userExperience: json['userExperience'] as String,
      userSkills: json['userSkills'] as String,
    );

Map<String, dynamic> _$CoverletterRequestModelToJson(
        CoverletterRequestModel instance) =>
    <String, dynamic>{
      'jobPost': instance.jobPost,
      'userName': instance.userName,
      'userDegree': instance.userDegree,
      'userTitle': instance.userTitle,
      'userExperience': instance.userExperience,
      'userSkills': instance.userSkills,
    };
