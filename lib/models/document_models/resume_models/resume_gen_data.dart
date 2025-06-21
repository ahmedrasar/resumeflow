import 'package:resumeflow/models/document_models/interfaces/gen_data.dart';

class ResumeGenData extends GenData {
  final List<String> skills;
  final List<String> experience;

  const ResumeGenData({required this.skills, required this.experience});
}
