import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resumeflow/models/cover_letter_models/cover_letter_models.dart';

class CoverLetterGenerationServiceException implements Exception {
  final http.Response response;
  const CoverLetterGenerationServiceException(this.response);
  @override
  String toString() {
    final request = response.request! as http.Request;
    return '''CoverLetterGenerationServiceException:
Requset: ${request.method} ${request.url}
With Headers: ${request.headers}
And Payload: ${request.body} 
...Failed with:
Status code: ${response.statusCode} 
Headers: ${response.headers}
Payload: ${response.body}''';
  }
}

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

  Future<String> _getKey() async {
    final response = await _client.get(Uri.parse('$_apiUrl/generate-api-key'));
    final key = (jsonDecode(response.body) as Map<String, dynamic>)['api_key']
        as String?;
    if (key == null) {
      throw CoverLetterGenerationServiceException(response);
    }
    return key;
  }

  /// Throws [CoverLetterGenerationServiceException] on server error
  Future<CoverLetterGenerativeData> generateData(
      CoverLetterRequestModel coverLetterRM) async {
    final apiKey = await _getKey();

    final headers = <String, String>{
      'x-api-key': apiKey,
      'content-type': 'application/json',
    };

    final body = coverLetterRM.toJson();

    final response = await _client.post(
      Uri.parse('$_apiUrl/generate-cover-letter'),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw CoverLetterGenerationServiceException(response);
    }

    return CoverLetterResponseModel.fromJson(jsonDecode(response.body)).data;
  }
}
