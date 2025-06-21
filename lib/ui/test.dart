import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdfx/pdfx.dart';
import 'package:resumeflow/models/px_models/pk_resume_model.dart';
import 'package:resumeflow/utils/file_saver/file_saver.dart';
import 'package:resumeflow/utils/pdf_util/pdf_util.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  PdfControllerPinch pdfController = PdfControllerPinch(
    document: PdfDocument.openData(PdfUtil.buildEmptyPage()),
  );

  sendRawReq() async {
    var headers = {
      'accept': 'application/json',
      'X-API-Key': 'a4dT122_Irg1k5czdpHQi0LGDwMNLdi_Uy9PbSSfurA',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      "information": {
        "address": "123 Example Street",
        "email": "example@gmail.com",
        "github": "github.com/example",
        "linkedin": "linkedin.com/in/example",
        "name": "Ahmed Ragab",
        "phone": "01123456789",
        "summary": "Software engineer with 5 years experience",
      },
      "education": [
        {
          "degree": "BSc Computer Science",
          "end_date": "2020",
          "gpa": "3.5",
          "location": "Tanta, Egypt",
          "school": "Example University",
          "start_date": "2016",
        },
      ],
      "projects": [
        {
          "description": "Project description",
          "end_date": "2022",
          "name": "Project Name",
          "skills": "Python, FastAPI, Google Gemini AI, PyTest, Pydantic",
        },
      ],
      "experience": [
        {
          "company": "Example Company",
          "description": "Job description",
          "end_date": "Present",
          "start_date": "2020",
          "title": "Software Engineer",
        },
      ],
      "technical_skills": {
        "Other Skills": ["AWS", "Azure"],
        "Programming Languages": ["Python", "Java"],
        "Tools": ["Git", "Docker"],
      },
      "soft_skills": ["Communication", "Problem Solving"],
      "output_format": "both",
    });

    final response = await http.post(
      Uri.parse(
        'http://resumeai.webredirect.org/api/resume-flow/create-resume',
      ),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final json = response.body;
      final stringbytes = jsonDecode(json)['pdf_file'] as String;
      final bytes = base64Decode(stringbytes);
      await pdfController.loadDocument(PdfDocument.openData(bytes));
      await FileSaver.saveAs(
        bytes,
        fileName: 'resume.pdf',
        prompt: 'Save your generated resume',
      );
      setState(() {});
    } else {
      log(response.reasonPhrase ?? 'Unknown error');
    }
  }

  sendStructuredReq() async {
    final then = DateTime.now();
    final resumeModel = PkResumeModel(
      information: PkInformation(
        name: "John Ali",
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

    final jsonmap = resumeModel.toJson()..['output_format'] = 'pdf';
    final body = json.encode(jsonmap);

    var headers = {
      'accept': 'application/json',
      'X-API-Key': 'a4dT122_Irg1k5czdpHQi0LGDwMNLdi_Uy9PbSSfurA',
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      Uri.parse(
        'http://resumeai.webredirect.org/api/resume-flow/create-resume',
      ),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final json = response.body;
      final stringbytes = jsonDecode(json)['pdf_file'] as String;
      final bytes = base64Decode(stringbytes);
      await pdfController.loadDocument(PdfDocument.openData(bytes));
      await FileSaver.saveAs(
        bytes,
        fileName: 'resume.pdf',
        prompt: 'Save your generated resume',
      );
      log(DateTime.now().difference(then).inMilliseconds.toString());
      setState(() {});
    } else {
      log(response.reasonPhrase ?? 'Unknown error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(onPressed: sendStructuredReq, child: Text('send request')),
          SizedBox(
            width: 450,
            height: 600,
            child: PdfViewPinch(controller: pdfController),
          ),
        ],
      ),
    );
  }
}
