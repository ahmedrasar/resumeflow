import 'package:resumeflow/utils/json_util/json_util.dart';
import 'package:test/test.dart';

void main() {
  group('JsonUtil Tests', () {
    test('Trim code annotations', () {
      // Arrange
      final jsonText = '```json{"field": "value"}```';

      // Act
      final json = JsonUtil.trimCodeAnnotations(jsonText);

      // Assert
      expect(json, '{"field": value}');
    });
  });
}
