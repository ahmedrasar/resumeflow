import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;

class LayoutHelper {
  static const _wideThreashold = 600;
  final double _width;

  LayoutHelper({required double width}) : _width = width;

  bool isCompact() => _width < _wideThreashold;
  bool isWide() => !isCompact();
  bool isWeb() => kIsWeb;
  bool isDesktop() =>
      !isWeb() && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
  bool isMobile() => !isWeb() && (Platform.isAndroid || Platform.isIOS);
}
