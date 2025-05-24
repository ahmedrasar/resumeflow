import 'dart:io';

import 'package:docx_template/docx_template.dart';
import 'package:resumeflow/constants/asset_paths/asset_paths.dart';
import 'package:test/test.dart';

void main() {
  group(
    'docx_template library test',
    () {
      test(
        'Generating file does not throw exception',
        () async {
          // Arrange
          final f = File(AssetPaths.coverLetterTemplatePath);
          final docx = await DocxTemplate.fromBytes(await f.readAsBytes());

          final nameReplacer = TextContent('applicant-name', '<NAME>');
          final c = Content()..add(nameReplacer);

          // Act
          final bytes = await docx.generate(c);

          // Assert
          expect(bytes, isNotNull);
        },
      );
    },
  );
}
