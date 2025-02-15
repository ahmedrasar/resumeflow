import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resumeflow/models/cover_letter_models/cover_letter_models.dart';
import 'package:resumeflow/models/gen_ai_service_interfaces/cover_letter_gen_service_interface/cover_letter_gen_service_model.dart';
import 'package:resumeflow/models/gen_ai_service_interfaces/gen_ai_exception.dart';

class ServerCoverLetterGenService implements CoverLetterGenServiceInterface {
  final http.Client _client;
  static const _apiUrl = 'https://resumeai.up.railway.app';

  ServerCoverLetterGenService(http.Client httpClient) : _client = httpClient;

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
      throw GenAiException.fromResponse(response);
    }
    return key;
  }

  @override
  Future<CoverLetterGenData> genData(
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
      throw GenAiException.fromResponse(response);
    }

    return CoverLetterResponseModel.fromJson(jsonDecode(response.body)).data;
  }
}
