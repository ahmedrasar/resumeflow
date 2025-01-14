/// Holds all user data
class CoverletterData {
  // Recipient-related
  final String recipientName;
  final String recipientJobPost;

  // Applicant-related
  final String applicantName;
  final String applicantAddress;
  final String applicantTelephone;
  final String applicantEmail;
  final String applicantDegree;
  final String applicantTitle;
  final String applicantExperience;
  final String applicantSkills;

  CoverletterData({
    required this.recipientName,
    required this.recipientJobPost,
    required this.applicantName,
    required this.applicantAddress,
    required this.applicantTelephone,
    required this.applicantEmail,
    required this.applicantDegree,
    required this.applicantTitle,
    required this.applicantExperience,
    required this.applicantSkills,
  });
}
