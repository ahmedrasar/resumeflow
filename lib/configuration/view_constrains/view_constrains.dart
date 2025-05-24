import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart' show windowManager, WindowManager;

const _windowsMinSize = Size(1280, 720);

Future<void> configureViewConstrains() async {
  if (kIsWeb) return;

  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(_windowsMinSize);
  }
}
