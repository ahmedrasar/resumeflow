import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resumeflow/models/coverletter_models/coverletter_model.dart';
import 'package:resumeflow/models/coverletter_models/coverletter_models.dart';

class CoverletterGenService {
  final http.Client _client;
  static final _apiUrl =
      'https://generate-cover-letter-fast-api-production.up.railway.app';

  CoverletterGenService(http.Client httpClient) : _client = httpClient;

  Future<bool> isHealthy() async {
    final response = await _client.get(Uri.parse('$_apiUrl/health'));
    return (jsonDecode(response.body) as Map<String, dynamic>)['health'] ==
            'healthy'
        ? true
        : false;
  }

  /// Returns [null] when not healthy
  Future<String?> getKey() async {
    final response = await _client.get(Uri.parse('$_apiUrl/generate-api-key'));
    return (jsonDecode(response.body) as Map<String, dynamic>)['api_key']
        as String?;
  }

  /// Returns [null] on auth error
  Future<CoverletterModel?> createCoverLetter(
      CoverletterRequestModel requestModel,
      {String? apiKey}) async {
    apiKey ??= await getKey();

    final headers = <String, String>{
      'x-api-key': apiKey!,
    };

    final body = requestModel.toJson();

    final response = await _client.post(
      Uri.parse('$_apiUrl/generate-api-key'),
      headers: headers,
      body: body,
    );

    if (response.statusCode != 200) return null;

    return CoverletterModel.fromJson(jsonDecode(response.body));
  }
}
