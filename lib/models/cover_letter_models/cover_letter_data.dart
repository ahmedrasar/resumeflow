/// Holds all user data
class CoverLetterData {
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
  final String experience;
  final String skills;

  const CoverLetterData({
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
}
