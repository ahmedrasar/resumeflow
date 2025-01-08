import 'dart:ui';

import 'package:window_manager/window_manager.dart';

import 'view_constrains_interface.dart';

const _windowsMinSize = Size(1280, 720);

class DesktopViewConstrains implements ViewConstrains {
  @override
  Future<void> configureViewConstrains() async {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(_windowsMinSize);
  }
}
