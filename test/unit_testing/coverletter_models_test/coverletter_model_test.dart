import 'package:test/test.dart';
import 'package:resumeflow/models/coverletter_models/coverletter_model.dart';

void main() {
  group('CoverletterModel', () {
    test('fromJson should correctly parse JSON data', () {
      // Arrange
      final json = {'data': 'test cover letter content'};

      // Act
      final coverLetter = CoverletterModel.fromJson(json);

      // Assert
      expect(coverLetter.data, 'test cover letter content');
    });

    test('toJson should correctly serialize to JSON', () {
      // Arrange
      final coverLetter = CoverletterModel(data: 'test cover letter content');

      // Act
      final json = coverLetter.toJson();

      // Assert
      expect(json, {'data': 'test cover letter content'});
    });

    test('should throw when JSON data is invalid', () {
      // Arrange
      final invalidJson = {'wrong_key': 'test content'};

      // Act & Assert
      expect(
        () => CoverletterModel.fromJson(invalidJson),
        throwsA(isA<Error>()),
      );
    });
  });
}
