import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:resumeflow/l10n/resumeflow_localizations_en.dart';
import 'package:resumeflow/models/document_models/interfaces/acquired_data.dart';
import 'package:resumeflow/services/gemini_service/gemini_resume_gen_service.dart';
import 'package:resumeflow/utils/gemini_models_enum/gemini_models_enum.dart';
import 'package:test/test.dart';

const apiKey = 'AIzaSyCKOknxt_HC9j7lq0EtKKoJeAsDvdCZajE';
const acquiredData = AcquiredData(
  name: 'John Doe',
  email: 'john.doe@example.com',
  telephone: '+1234567890',
  address: '123 Main St, Springfield',
  degree: 'Computer Science',
  title: 'Software Enginnering',
  skills: "Dart, Flutter, Git, Clean Code, Data Structure",
  experience: "- 3 months as an intern. - 2 years as a flutter dev",
  companyName: 'Gx Software',
  jobPost:
      'We are seeking a Flutter Developer to join our mobile team. Responsibilities include building and maintaining high-quality mobile applications using Flutter, collaborating with cross-functional teams, and ensuring performance and responsiveness. Requirements: experience with Dart and Flutter, knowledge of RESTful APIs, Git, and a passion for clean code.',
);

void main() {
  group('GeminiResumeGenDataService Tests', () {
    test('TODO:', () async {
      final service = GeminiResumeGenService(
        ResumeflowLocalizationsEn(),
        GenerativeModel(
          model: GeminiModelsEnum.g2Flash.modelCode,
          apiKey: apiKey,
        ),
      );

      final genData = await service.genData(acquiredData);
    });
  });
}
