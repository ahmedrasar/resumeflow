import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;

import 'package:docx_template/docx_template.dart';
import 'package:resumeflow/constants/asset_paths/asset_paths.dart';
import 'package:resumeflow/models/document_models/resume_models/resume_model.dart';
import 'package:resumeflow/utils/docx_util/docx_util.dart';

base class ResumeDocxUtil extends ResumeDocxUtilBase {
  DocxTemplate? _template;

  ResumeDocxUtil();

  @override
  Future<void> init() async {
    final templateFile = await rootBundle.load(
      AssetPaths.coverLetterTemplatePath,
    );
    _template = await DocxTemplate.fromBytes(
      Int8List.sublistView(templateFile),
    );
  }

  @override
  Future<Uint8List> fromModel(ResumeModel model) async {
    if (_template == null) await init();

    final content =
        Content()..addAll({
          DocxUtil.recipientNameKey: TextContent(
            DocxUtil.recipientNameKey,
            model.companyName,
          ),
          DocxUtil.applicantNameKey: TextContent(
            DocxUtil.applicantNameKey,
            model.name,
          ),
          DocxUtil.addressKey: TextContent(DocxUtil.addressKey, model.address),
          DocxUtil.telephoneKey: TextContent(
            DocxUtil.telephoneKey,
            model.telephone,
          ),
          DocxUtil.emailKey: TextContent(DocxUtil.emailKey, model.email),

          // TODO: Implement Resume docx
          // DocxUtil.bodyKey: TextContent(DocxUtil.bodyKey, model.skills),
          // DocxUtil.bodyKey: TextContent(DocxUtil.bodyKey, model.experience),
        });

    final bytes = await _template!.generate(content);
    if (bytes == null || bytes.isEmpty) {
      throw DocxUtilException(l10n.docxUtilFailedToGenerate);
    }

    return Uint8List.fromList(bytes);
  }
}
