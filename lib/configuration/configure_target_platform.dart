import 'url_strategy/url_strategy.dart';
import 'view_constrains/view_constrains.dart';

Future<void> configureTargetPlatform() async {
  configureTargetPlatfomrUrlStrategy();
  await configureViewConstrains();
}
