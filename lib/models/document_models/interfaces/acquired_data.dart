import 'package:json_annotation/json_annotation.dart';

part 'acquired_data.g.dart';

/// Holds all data acquired from the user.
/// Converted to json to send with web requests.
@JsonSerializable(createFactory: false)
class AcquiredData {
  // Recipient-related
  final String companyName;
  final String jobPost;

  // Applicant-related
  final String name;
  final String address;
  final String telephone;
  final String email;
  final String degree;
  final String title;
  final String skills;
  final String experience;

  const AcquiredData({
    required this.companyName,
    required this.jobPost,
    required this.name,
    required this.address,
    required this.telephone,
    required this.email,
    required this.degree,
    required this.title,
    required this.experience,
    required this.skills,
  });

  Map<String, dynamic> toJson() => _$AcquiredDataToJson(this);
}
