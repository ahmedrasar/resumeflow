import 'non_web_url_strategy.dart'
    if (dart.library.html) 'web_url_strategy.dart';

void configureTargetPlatfomrUrlStrategy() {
  TargetPlatformUrlStrategy().configureUrlStrategy();
}
