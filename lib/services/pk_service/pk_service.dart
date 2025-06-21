import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:resumeflow/models/px_models/pk_resume_model.dart';

class PkServiceException implements Exception {
  final int code;
  final String message;
  PkServiceException(this.code, this.message);

  @override
  String toString() => 'PkServiceException: $message';
}

class PkService {
  static final _baseUrl = Uri.parse(
    'http://resumeai.webredirect.org/api/resume-flow',
  );
  static const _apiKey = String.fromEnvironment('PK_API_KEY');

  static Future<String> pkProjectSummary({
    required String name,
    required String skills,
    required String description,
  }) async {
    if ([name, skills, description].any((str) => str.isEmpty)) {
      return '';
    }

    final headers = {
      'accept': 'application/json',
      'X-API-Key': _apiKey,
      'Content-Type': 'application/json',
    };

    final body = json.encode({
      'project_name': name,
      'project_description': description,
      'skills': skills,
    });

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/generate-project-description'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        return jsonDecode(body)['project_description'] as String;
      } else {
        throw PkServiceException(
          -1,
          'Failed to generate summary: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw PkServiceException(-1, 'Error generating summary: $e');
    }
  }

  static Future<String> pkSummary({
    required String title,
    required String yearsExp,
    required String skills,
    required String achievements,
  }) async {
    if ([title, yearsExp, skills, achievements].any((str) => str.isEmpty)) {
      return '';
    }
    final headers = {
      'accept': 'application/json',
      'X-API-Key': _apiKey,
      'Content-Type': 'application/json',
    };

    final body = json.encode({
      'current_title': title,
      'years_experience': yearsExp,
      'skills': skills,
      'achievements': achievements,
    });

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/generate-summary'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['summary'] as String;
      } else {
        throw PkServiceException(
          -1,
          'Failed to generate summary: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw PkServiceException(-1, 'Error generating summary: $e');
    }
  }

  static Future<Uint8List> pkResume(PkResumeModel model) async {
    final headers = {
      'accept': 'application/json',
      'X-API-Key': _apiKey,
      'Content-Type': 'application/json',
    };

    final body = model.toJson()..['output_format'] = 'pdf';

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/create-resume'),
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final json = response.body;
        final stringbytes = jsonDecode(json)['pdf_file'] as String;
        return base64Decode(stringbytes);
      } else {
        throw PkServiceException(
          -1,
          'Failed to generate resume: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw PkServiceException(-1, 'Error generating resume: $e');
    }
  }
}
