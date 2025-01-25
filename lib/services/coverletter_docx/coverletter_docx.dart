import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;

import 'package:docx_template/docx_template.dart';
import 'package:resumeflow/models/coverletter_models/coverletter_models.dart';
import 'package:resumeflow/utils/asset_paths/asset_helper.dart';

class CoverletterDocx {
  static const String _recipientNameKey = 'recipient-name';
  static const String _applicantNameKey = 'applicant-name';
  static const String _addressKey = 'address';
  static const String _telephoneKey = 'telephone';
  static const String _emailKey = 'email';
  static const String _genBodyKey = 'body';

  static Future<List<int>?> fromModel(CoverletterModel model) async {
    final templateFile =
        await rootBundle.load(AssetPaths.coverletterTemplatePath);
    final template =
        await DocxTemplate.fromBytes(Int8List.sublistView(templateFile));

    final content = Content()
      ..addAll({
        _recipientNameKey: TextContent(_recipientNameKey, model.recipientName),
        _applicantNameKey: TextContent(_applicantNameKey, model.applicantName),
        _addressKey: TextContent(_addressKey, model.applicantAddress),
        _telephoneKey: TextContent(_telephoneKey, model.applicantTelephone),
        _emailKey: TextContent(_emailKey, model.applicantEmail),
        _genBodyKey: TextContent(_genBodyKey, model.genBody),
      });

    return await template.generate(content);
  }
}
