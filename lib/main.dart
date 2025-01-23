import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:resumeflow/l10n/resumeflow_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'configuration/configure_target_platform.dart';
import 'firebase_options.dart';
import 'repos/settings_repo/settings_repo.dart';
import 'router/router.dart';
import 'themes/themes.dart';

void main() async {
  // Core configuration
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Animate.restartOnHotReload = true;

  // Target platform specific configuration
  await configureTargetPlatform();

  // Load Platform Data
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsRepository>.value(
          value: SettingsRepository(sharedPreferences),
        )
      ],
      builder: (context, _) {
        final settingsRepository = context.watch<SettingsRepository>();

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          themeMode: settingsRepository.themeModeLO.object,
          theme: lightTheme,
          darkTheme: darkTheme,
          locale: settingsRepository.localeLO.object.locale,
          localeListResolutionCallback: (locales, supportedLocales) {
            if (locales == null) return supportedLocales.first;
            for (final locale in locales) {
              if (supportedLocales.contains(Locale(locale.languageCode))) {
                return Locale(locale.languageCode);
              }
            }
            return supportedLocales.first;
          },
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          localizationsDelegates: const [
            ResumeflowLocalizations.delegate,
            // Flutter Localization Delegates
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    ),
  );
}
