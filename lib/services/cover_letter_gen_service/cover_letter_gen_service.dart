import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resumeflow/models/cover_letter_models/cover_letter_models.dart';

class CoverLetterGenerationService {
  final http.Client _client;
  static const _apiUrl = 'https://resumeai.up.railway.app';

  CoverLetterGenerationService(http.Client httpClient) : _client = httpClient;

  Future<bool> isHealthy() async {
    final response = await _client.get(Uri.parse('$_apiUrl/health'));
    return (jsonDecode(response.body) as Map<String, dynamic>)['health'] ==
            'healthy'
        ? true
        : false;
  }

  /// Returns [null] when not healthy
  Future<String?> _getKey() async {
    final response = await _client.get(Uri.parse('$_apiUrl/generate-api-key'));
    return (jsonDecode(response.body) as Map<String, dynamic>)['api_key']
        as String?;
  }

  /// Returns [null] on auth error
  Future<CoverLetterGenerativeData?> generateData(
      CoverLetterRequestModel requestModel) async {
    final apiKey = await _getKey();
    if (apiKey == null) return null;

    final headers = <String, String>{
      'x-api-key': apiKey,
      'content-type': 'application/json',
    };

    final body = requestModel.toJson();

    final response = await _client.post(
      Uri.parse('$_apiUrl/generate-cover-letter'),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) return null;

    return CoverLetterResponseModel.fromJson(jsonDecode(response.body)).data;
  }
}
