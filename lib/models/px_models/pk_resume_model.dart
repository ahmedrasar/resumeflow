import 'package:json_annotation/json_annotation.dart';

part 'pk_resume_model.g.dart';

@JsonSerializable()
class PkInformation {
  final String name;
  final String address;
  final String email;
  final String phone;
  final String github;
  final String linkedin;
  String? summary;

  PkInformation({
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    required this.github,
    required this.linkedin,
    this.summary,
  });

  Map<String, dynamic> toJson() => _$PkInformationToJson(this);
}

@JsonSerializable()
class PkEducation {
  final String degree;
  final String school;
  final String location;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
  final String gpa;

  PkEducation({
    required this.degree,
    required this.school,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.gpa,
  });

  Map<String, dynamic> toJson() => _$PkEducationToJson(this);
}

@JsonSerializable()
class PkProject {
  final String name;
  final String description;
  @JsonKey(name: 'end_date')
  final String endDate;
  final String skills;

  PkProject({
    required this.name,
    required this.description,
    required this.endDate,
    required this.skills,
  });

  Map<String, dynamic> toJson() => _$PkProjectToJson(this);
}

@JsonSerializable()
class PkExperience {
  final String company;
  final String title;
  final String description;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;

  PkExperience({
    required this.company,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() => _$PkExperienceToJson(this);
}

@JsonSerializable()
class PkTechnicalSkills {
  @JsonKey(name: 'Programming Languages')
  final List<String> programmingLanguages;
  @JsonKey(name: 'Tools')
  final List<String> tools;
  @JsonKey(name: 'Other Skills')
  final List<String> otherSkills;

  PkTechnicalSkills({
    required this.programmingLanguages,
    required this.tools,
    required this.otherSkills,
  });

  Map<String, dynamic> toJson() => _$PkTechnicalSkillsToJson(this);
}

@JsonSerializable(
  converters: [
    _PkInformationJsonConverter(),
    _PkEducationJsonConverter(),
    _PkProjectJsonConverter(),
    _PkExperienceJsonConverter(),
    _PkTechnicalSkillsJsonConverter(),
  ],
)
class PkResumeModel {
  final PkInformation information;
  final List<PkEducation> education;
  final List<PkProject> projects;
  final List<PkExperience> experience;
  @JsonKey(name: 'technical_skills')
  final PkTechnicalSkills technicalSkills;
  @JsonKey(name: 'soft_skills')
  final List<String> softSkills;

  PkResumeModel({
    required this.information,
    required this.education,
    required this.projects,
    required this.experience,
    required this.technicalSkills,
    required this.softSkills,
  });

  Map<String, dynamic> toJson() => _$PkResumeModelToJson(this);
}

class _PkInformationJsonConverter
    implements JsonConverter<PkInformation, Map<String, dynamic>> {
  const _PkInformationJsonConverter();

  @override
  PkInformation fromJson(Map<String, dynamic> json) =>
      _$PkInformationFromJson(json);

  @override
  Map<String, dynamic> toJson(PkInformation object) => object.toJson();
}

class _PkEducationJsonConverter
    implements JsonConverter<PkEducation, Map<String, dynamic>> {
  const _PkEducationJsonConverter();

  @override
  PkEducation fromJson(Map<String, dynamic> json) =>
      _$PkEducationFromJson(json);

  @override
  Map<String, dynamic> toJson(PkEducation object) => object.toJson();
}

class _PkProjectJsonConverter
    implements JsonConverter<PkProject, Map<String, dynamic>> {
  const _PkProjectJsonConverter();

  @override
  PkProject fromJson(Map<String, dynamic> json) => _$PkProjectFromJson(json);
  @override
  Map<String, dynamic> toJson(PkProject object) => object.toJson();
}

class _PkExperienceJsonConverter
    implements JsonConverter<PkExperience, Map<String, dynamic>> {
  const _PkExperienceJsonConverter();

  @override
  PkExperience fromJson(Map<String, dynamic> json) =>
      _$PkExperienceFromJson(json);

  @override
  Map<String, dynamic> toJson(PkExperience object) => object.toJson();
}

class _PkTechnicalSkillsJsonConverter
    implements JsonConverter<PkTechnicalSkills, Map<String, dynamic>> {
  const _PkTechnicalSkillsJsonConverter();

  @override
  PkTechnicalSkills fromJson(Map<String, dynamic> json) =>
      _$PkTechnicalSkillsFromJson(json);

  @override
  Map<String, dynamic> toJson(PkTechnicalSkills object) => object.toJson();
}
