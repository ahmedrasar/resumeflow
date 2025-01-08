import 'dart:io';

import 'package:flutter/foundation.dart';

import 'desktop_view_constrains.dart';

Future<void> configureViewConstrains() async {
  if (kIsWeb) return;

  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await DesktopViewConstrains().configureViewConstrains();
  }
}
