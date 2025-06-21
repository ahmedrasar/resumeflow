import 'package:flutter/foundation.dart';
import 'file_saver_io.dart' if (dart.library.html) 'file_saver_web.dart';

class FileSaver {
  static Future<bool> saveAs(
    Uint8List bytes, {
    required String prompt,
    required String fileName,
  }) async {
    return TargetFileSaver().saveFile(bytes, fileName, prompt);
  }
}
