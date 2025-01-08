import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'url_strategy_interface.dart';

class TargetPlatformUrlStrategy implements PlatformUrlStrategy {
  @override
  void configureUrlStrategy() {
    usePathUrlStrategy();
  }
}
