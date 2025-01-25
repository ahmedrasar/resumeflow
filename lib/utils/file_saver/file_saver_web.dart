import 'dart:convert';

import 'package:resumeflow/utils/file_saver/file_saver_interface.dart';
import 'package:web/web.dart' as web;

class TargetFileSaver implements FileSaverInterface {
  const TargetFileSaver();

  @override
  Future<bool> saveFile(
      List<int> bytes, String fileName, String prompt, String extension) {
    final web.HTMLAnchorElement anchor =
        web.document.createElement('a') as web.HTMLAnchorElement
          ..href = 'data:application/octet-stream;base64,${base64Encode(bytes)}'
          ..style.display = 'none'
          ..download = fileName;

    web.document.body!.appendChild(anchor);
    anchor.click();
    web.document.body!.removeChild(anchor);
    return Future.value(true);
  }
}
