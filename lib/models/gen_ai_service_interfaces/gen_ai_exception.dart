import 'package:http/http.dart' as http;

class GenAiException implements Exception {
  final int code;
  final String message;
  const GenAiException(this.code, this.message);

  factory GenAiException.fromResponse(http.Response response) {
    final request = response.request! as http.Request;
    final message = '''Generative AI Execption:
Requset: ${request.method} ${request.url}
With Headers: ${request.headers}
And Payload: ${request.body} 
...Failed with:
Status code: ${response.statusCode} 
Headers: ${response.headers}
Payload: ${response.body}''';
    return GenAiException(response.statusCode, message);
  }

  @override
  String toString() => message;
}
