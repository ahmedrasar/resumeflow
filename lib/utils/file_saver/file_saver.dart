import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'package:resumeflow/models/coverletter_models/coverletter_models.dart';
import 'package:resumeflow/services/coverletter_docx/coverletter_docx.dart';
import 'package:web/web.dart' as web;

class FileSaver {
  static Future<bool> saveCoverLetter(CoverletterModel model,
      {required String prompt}) async {
    final bytes = await CoverletterDocx.fromModel(model);
    final fileName = '${model.recipientName}-cover-letter.docx';
    return kIsWeb
        ? _saveFileWeb(bytes!, fileName)
        : await _saveFileIO(bytes!, fileName, prompt, 'docx');
  }

  static Future<bool> _saveFileIO(
      List<int> bytes, String fileName, String prompt, String extension) async {
    final file = await FilePicker.platform.saveFile(
        dialogTitle: prompt,
        type: FileType.custom,
        allowedExtensions: [extension],
        fileName: fileName,
        initialDirectory: (await getApplicationDocumentsDirectory()).path);
    if (file == null) return false;
    await File(file).writeAsBytes(bytes);
    return true;
  }

  static bool _saveFileWeb(List<int> bytes, String fileName) {
    final web.HTMLAnchorElement anchor =
        web.document.createElement('a') as web.HTMLAnchorElement
          ..href = 'data:application/octet-stream;base64,${base64Encode(bytes)}'
          ..style.display = 'none'
          ..download = fileName;

    web.document.body!.appendChild(anchor);
    anchor.click();
    web.document.body!.removeChild(anchor);
    return true;
  }
}
