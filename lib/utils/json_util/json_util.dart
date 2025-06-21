class JsonUtil {
  static trimCodeAnnotations(String text) {
    var json = text.trim();
    if (json.startsWith('```')) json = json.substring(3);
    if (json.startsWith('json')) json = json.substring(4);
    if (json.endsWith('```')) json = json.substring(0, json.length - 3);
    return json.trim();
  }
}
