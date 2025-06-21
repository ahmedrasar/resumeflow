import 'package:resumeflow/models/px_models/pk_resume_model.dart';
import 'package:resumeflow/services/pk_service/pk_service.dart';
import 'package:test/test.dart';

final _json = '''{
  "information": {
    "address": "123 Example Street",
    "email": "example@gmail.com",
    "github": "github.com/example",
    "linkedin": "linkedin.com/in/example",
    "name": "John Doe",
    "phone": "01123456789",
    "summary": "Software engineer with 5 years experience"
  },
  "education": [
    {
      "degree": "BSc Computer Science",
      "end_date": "2020",
      "gpa": "3.5",
      "location": "Tanta, Egypt",
      "school": "Example University",
      "start_date": "2016"
    }
  ],
  "projects": [
    {
      "description": "Project description",
      "end_date": "2022",
      "name": "Project Name",
      "skills": "Python, FastAPI, Google Gemini AI, PyTest, Pydantic"
    }
  ],
  "experience": [
    {
      "company": "Example Company",
      "description": "Job description",
      "end_date": "Present",
      "start_date": "2020",
      "title": "Software Engineer"
    }
  ],
  "technical_skills": {
    "Other Skills": [
      "AWS",
      "Azure"
    ],
    "Programming Languages": [
      "Python",
      "Java"
    ],
    "Tools": [
      "Git",
      "Docker"
    ]
  },
  "soft_skills": [
    "Communication",
    "Problem Solving"
  ],
  }''';

void main() {
  test('description 2', () async {
    final summary = await PkService.pkSummary(
      title: 'Software Enginnger',
      yearsExp: '5 years as a flutter dev',
      skills: 'git, c++, java, desing patters',
      achievements: 'cs degree, 2 years in google',
    );

    expect(summary, isNot(''));
    // You can add assertions here if needed, for example:
    // expect(summary, isNotNull);
  });

  test('description', () {
    final pkResume = PkResumeModel(
      information: PkInformation(
        name: "John Doe",
        address: "123 Example Street",
        email: "example@gmail.com",
        phone: "01123456789",
        github: "github.com/example",
        linkedin: "linkedin.com/in/example",
        summary: "Software engineer with 5 years experience",
      ),
      education: [
        PkEducation(
          degree: "BSc Computer Science",
          school: "Example University",
          location: "Tanta, Egypt",
          startDate: "2016",
          endDate: "2020",
          gpa: "3.5",
        ),
      ],
      projects: [
        PkProject(
          name: "Project Name",
          description: "Project description",
          endDate: "2022",
          skills: "Python, FastAPI, Google Gemini AI, PyTest, Pydantic",
        ),
      ],
      experience: [
        PkExperience(
          company: "Example Company",
          title: "Software Engineer",
          description: "Job description",
          startDate: "2020",
          endDate: "Present",
        ),
      ],
      technicalSkills: PkTechnicalSkills(
        programmingLanguages: ["Python", "Java"],
        tools: ["Git", "Docker"],
        otherSkills: ["AWS", "Azure"],
      ),
      softSkills: ["Communication", "Problem Solving"],
    );

    expect(pkResume.toJson(), _json);
  });
}
