import 'package:flutter/material.dart';
import 'package:resumeflow/utils/ai_model_enum/ai_model_enum.dart';
import 'package:resumeflow/utils/local_object/local_object.dart';
import 'package:resumeflow/utils/locale_enum/locale_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository with ChangeNotifier {
  static const _themeKey = 'cur-theme-key';
  static const _localeKey = 'cur-locale-key';
  static const _aiModelKey = 'cur-ai-model-key';

  final SharedPreferences _sharedPreferences;

  SettingsRepository(this._sharedPreferences) {
    themeModeLO = EnumLocalObject<ThemeMode>(
        objectKey: _themeKey,
        fallbackObject: ThemeMode.system,
        sharedPreferences: _sharedPreferences,
        onChangeCallback: notifyListeners,
        values: ThemeMode.values);
    localeLO = EnumLocalObject<LocaleEnum>(
        objectKey: _localeKey,
        fallbackObject: LocaleEnum.system,
        sharedPreferences: _sharedPreferences,
        onChangeCallback: notifyListeners,
        values: LocaleEnum.values);
    aiModelLO = EnumLocalObject<AiGenServiceEnum>(
        objectKey: _aiModelKey,
        fallbackObject: AiGenServiceEnum.clientSide,
        sharedPreferences: _sharedPreferences,
        onChangeCallback: null,
        values: AiGenServiceEnum.values);
  }

  late final EnumLocalObject<ThemeMode> themeModeLO;
  late final EnumLocalObject<LocaleEnum> localeLO;
  late final EnumLocalObject<AiGenServiceEnum> aiModelLO;
}
