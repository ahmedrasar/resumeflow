import 'package:flutter/foundation.dart';

abstract interface class FileSaverInterface {
  Future<bool> saveFile(Uint8List bytes, String fileName, String prompt);
}
