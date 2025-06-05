import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class PlatformHelper {
  static const _wideThreashold = 600;
  final double _width;

  PlatformHelper({required double width}) : _width = width;

  bool get isCompact => _width < _wideThreashold;
  bool get isWide => !isCompact;
  static bool get isWeb => kIsWeb;
  static bool get isDesktop =>
      !isWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
  static bool get isMobile => !isWeb && (Platform.isAndroid || Platform.isIOS);
}

extension PlatformHelperExtension on BuildContext {
  PlatformHelper get platformHelper =>
      PlatformHelper(width: MediaQuery.of(this).size.width);
}
