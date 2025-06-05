import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:resumeflow/utils/platform_helper/platform_helper.dart';
import 'package:window_manager/window_manager.dart'
    show windowManager, WindowManager;

Future<void> configureViewConstrains() async {
  if (kIsWeb) return;

  if (PlatformHelper.isDesktop) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(Size(1280, 720));
  }
}
