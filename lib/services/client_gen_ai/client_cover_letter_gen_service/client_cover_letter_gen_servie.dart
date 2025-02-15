import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:resumeflow/models/cover_letter_models/cover_letter_models.dart';
import 'package:resumeflow/models/gen_ai_service_interfaces/cover_letter_gen_service_interface/cover_letter_gen_service_model.dart';
import 'package:resumeflow/models/gen_ai_service_interfaces/gen_ai_exception.dart';

class ClientCoverLetterGenServie implements CoverLetterGenServiceInterface {
  static final requestPromot = Content.text(
      '''Craft a professional cover letter using the provided job posting and candidate data. Focus solely on the essential content, eliminating any placeholder or template-style headers like addresses or contact information. 

Candidate Profile Will be provided as JSON Later.

Writing Guidelines:
1. Begin directly with "Dear Hiring Manager,"

2. First Paragraph:
   - Immediately state the position you're applying for without mentioning platform that has the post
   - Briefly introduce professional background
   - Create an immediate connection to the job requirements

3. Second Paragraph (Experience & Skills):
   - Directly address key technical requirements
   - Provide specific examples of relevant achievements
   - Quantify impacts where possible
   - Highlight most relevant technical skills

4. Third Paragraph (Value Proposition):
   - Explain why you're an ideal candidate
   - Demonstrate understanding of the company's technical needs
   - Express enthusiasm for potential contribution

5. Closing Paragraph:
   - Thank the reader for their consideration
   - Express interest in further discussion
   - Create a subtle call to action

Specific Requirements:
- Total length: 250-300 words
- Use a professional, confident tone
- Focus on technical achievements
- Avoid generic statements
- Sign off with "Sincerely," followed by the provided name in the next line
- Use numerals for all numbers (e.g., "5 years", "40% improvement") - never spell out numbers

Emphasize:
- Specific technologies from the job posting
- Practical experience
- Measurable impacts (always in numeral form)
- Alignment with job requirements

Generate a concise, impactful cover letter that goes straight to the professional content, using the provided candidate data throughout.
''');

  final GenerativeModel model;
  const ClientCoverLetterGenServie(this.model);

  @override
  Future<CoverLetterGenData> genData(
      CoverLetterRequestModel coverLetter) async {
    final prompt = [
      requestPromot,
      Content.text(coverLetter.toJson().toString())
    ];
    try {
      final response = await model.generateContent(prompt);
      return CoverLetterResponseModel(genBody: response.text!).data;
    } catch (_) {
      throw GenAiException(-1, 'Unkown error with client-side AI gen model.');
    }
  }
}
