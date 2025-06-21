import 'package:flutter/material.dart';
import 'package:resumeflow/services/gemini_service/gemini_service.dart';
import 'package:resumeflow/utils/gemini_models_enum/gemini_models_enum.dart';
import 'package:resumeflow/utils/local_object/local_object.dart';
import 'package:resumeflow/utils/locale_enum/locale_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository with ChangeNotifier {
  static const _themeKey = 'cur-theme-key';
  static const _localeKey = 'cur-locale-key';
  static const _geminiModelKey = 'cur-gemini-model-key';
  static const _previewResumeLo = 'cur-preview-resume-key';
  final SharedPreferences _sharedPreferences;

  late final EnumLocalObject<ThemeMode> themeModeLO;
  late final EnumLocalObject<LocaleEnum> localeLO;
  late final EnumLocalObject<GeminiModelsEnum> geminiModelsLO;
  late final SymmetricLocalObject<bool> previewResumeLO;

  Future<void> reset() async {
    await Future.wait(
      <LocalObject>[
        themeModeLO,
        localeLO,
        geminiModelsLO,
        previewResumeLO,
      ].map(((lo) => lo.reset(notify: false))),
    );

    notifyListeners();
  }

  SettingsRepository(this._sharedPreferences) {
    themeModeLO = EnumLocalObject<ThemeMode>(
      objectKey: _themeKey,
      fallbackObject: ThemeMode.system,
      sharedPreferences: _sharedPreferences,
      onChangeCallback: (_) => notifyListeners(),
      values: ThemeMode.values,
    );
    localeLO = EnumLocalObject<LocaleEnum>(
      objectKey: _localeKey,
      fallbackObject: LocaleEnum.system,
      sharedPreferences: _sharedPreferences,
      onChangeCallback: (_) => notifyListeners(),
      values: LocaleEnum.values,
    );
    geminiModelsLO = EnumLocalObject<GeminiModelsEnum>(
      objectKey: _geminiModelKey,
      fallbackObject: GeminiModelsEnum.g2Flash,
      sharedPreferences: _sharedPreferences,
      onChangeCallback: (value) => GeminiService.model = value,
      values: GeminiModelsEnum.values,
      callOnFirstLoad: true,
    );
    previewResumeLO = SymmetricLocalObject<bool>(
      objectKey: _previewResumeLo,
      fallbackObject: false,
      sharedPreferences: _sharedPreferences,
      onChangeCallback: (_) => notifyListeners(),
    );
  }
}
