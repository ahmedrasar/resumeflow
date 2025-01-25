import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:resumeflow/utils/file_saver/file_saver_interface.dart';

class TargetFileSaver implements FileSaverInterface {
  const TargetFileSaver();

  @override
  Future<bool> saveFile(
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
}
