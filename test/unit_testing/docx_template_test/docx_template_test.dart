import 'dart:io';

import 'package:docx_template/docx_template.dart';
import 'package:resumeflow/utils/asset_paths/asset_helper.dart';
import 'package:test/test.dart';

void main() {
  group(
    'docx_template_test',
    () {
      test(
        'simple text replacer test',
        () async {
          // Arrange
          final f = File(AssetPaths.coverletterTemplatePath);
          final docx = await DocxTemplate.fromBytes(await f.readAsBytes());

          final nameReplacer = TextContent('applicant-name', 'Ahmed Ragab');
          final c = Content()..add(nameReplacer);

          // Act
          final bytes = await docx.generate(c);
          await File('coverletter_test.docx').writeAsBytes(bytes!);

          // Assert
          expect(bytes, isNotNull);
        },
      );
    },
  );
}
