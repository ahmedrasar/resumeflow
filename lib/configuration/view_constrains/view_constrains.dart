import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart'
    show windowManager, WindowManager;

Future<void> configureViewConstrains() async {
  if (kIsWeb) return;

  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(Size(1280, 720));
  }
}
