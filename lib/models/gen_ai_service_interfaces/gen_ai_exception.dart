class GenAiException implements Exception {
  final int code;
  final String message;
  const GenAiException(this.code, this.message);

  @override
  String toString() => message;
}
