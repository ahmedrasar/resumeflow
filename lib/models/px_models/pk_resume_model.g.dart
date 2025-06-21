// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pk_resume_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PkInformation _$PkInformationFromJson(Map<String, dynamic> json) =>
    PkInformation(
      name: json['name'] as String,
      address: json['address'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      github: json['github'] as String,
      linkedin: json['linkedin'] as String,
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$PkInformationToJson(PkInformation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'email': instance.email,
      'phone': instance.phone,
      'github': instance.github,
      'linkedin': instance.linkedin,
      'summary': instance.summary,
    };

PkEducation _$PkEducationFromJson(Map<String, dynamic> json) => PkEducation(
  degree: json['degree'] as String,
  school: json['school'] as String,
  location: json['location'] as String,
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  gpa: json['gpa'] as String,
);

Map<String, dynamic> _$PkEducationToJson(PkEducation instance) =>
    <String, dynamic>{
      'degree': instance.degree,
      'school': instance.school,
      'location': instance.location,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'gpa': instance.gpa,
    };

PkProject _$PkProjectFromJson(Map<String, dynamic> json) => PkProject(
  name: json['name'] as String,
  description: json['description'] as String,
  endDate: json['end_date'] as String,
  skills: json['skills'] as String,
);

Map<String, dynamic> _$PkProjectToJson(PkProject instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'end_date': instance.endDate,
  'skills': instance.skills,
};

PkExperience _$PkExperienceFromJson(Map<String, dynamic> json) => PkExperience(
  company: json['company'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
);

Map<String, dynamic> _$PkExperienceToJson(PkExperience instance) =>
    <String, dynamic>{
      'company': instance.company,
      'title': instance.title,
      'description': instance.description,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };

PkTechnicalSkills _$PkTechnicalSkillsFromJson(Map<String, dynamic> json) =>
    PkTechnicalSkills(
      programmingLanguages:
          (json['Programming Languages'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      tools: (json['Tools'] as List<dynamic>).map((e) => e as String).toList(),
      otherSkills:
          (json['Other Skills'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$PkTechnicalSkillsToJson(PkTechnicalSkills instance) =>
    <String, dynamic>{
      'Programming Languages': instance.programmingLanguages,
      'Tools': instance.tools,
      'Other Skills': instance.otherSkills,
    };

PkResumeModel _$PkResumeModelFromJson(
  Map<String, dynamic> json,
) => PkResumeModel(
  information: const _PkInformationJsonConverter().fromJson(
    json['information'] as Map<String, dynamic>,
  ),
  education:
      (json['education'] as List<dynamic>)
          .map(
            (e) => const _PkEducationJsonConverter().fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
  projects:
      (json['projects'] as List<dynamic>)
          .map(
            (e) => const _PkProjectJsonConverter().fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
  experience:
      (json['experience'] as List<dynamic>)
          .map(
            (e) => const _PkExperienceJsonConverter().fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
  technicalSkills: const _PkTechnicalSkillsJsonConverter().fromJson(
    json['technical_skills'] as Map<String, dynamic>,
  ),
  softSkills:
      (json['soft_skills'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$PkResumeModelToJson(
  PkResumeModel instance,
) => <String, dynamic>{
  'information': const _PkInformationJsonConverter().toJson(
    instance.information,
  ),
  'education':
      instance.education.map(const _PkEducationJsonConverter().toJson).toList(),
  'projects':
      instance.projects.map(const _PkProjectJsonConverter().toJson).toList(),
  'experience':
      instance.experience
          .map(const _PkExperienceJsonConverter().toJson)
          .toList(),
  'technical_skills': const _PkTechnicalSkillsJsonConverter().toJson(
    instance.technicalSkills,
  ),
  'soft_skills': instance.softSkills,
};
