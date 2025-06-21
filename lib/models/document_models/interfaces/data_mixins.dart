class ApplicantData {
  final String name;
  final String address;
  final String telephone;
  final String email;

  ApplicantData({
    required this.name,
    required this.address,
    required this.telephone,
    required this.email,
  });
}

class RecipientData {
  final String companyName;

  RecipientData({required this.companyName});
}

class JobData {
  final String jopPost;

  JobData({required this.jopPost});
}
