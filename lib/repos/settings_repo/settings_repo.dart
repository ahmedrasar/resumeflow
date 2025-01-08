import 'package:flutter/material.dart';
import 'package:resumeflow/utils/local_object/local_object.dart';
import 'package:resumeflow/utils/locale_enum/locale_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository with ChangeNotifier {
  static const _themeKey = 'cur-theme-key';
  static const _localeKey = 'cur-local-key';

  final SharedPreferences _sharedPreferences;

  SettingsRepository(this._sharedPreferences) {
    themeModeLO = EnumLocalObject<ThemeMode>(
        objectKey: _themeKey,
        object: ThemeMode.system,
        sharedPreferences: _sharedPreferences,
        onChangeCallback: notifyListeners,
        values: ThemeMode.values);
    localeLO = EnumLocalObject<LocaleEnum>(
        objectKey: _localeKey,
        object: LocaleEnum.system,
        sharedPreferences: _sharedPreferences,
        onChangeCallback: notifyListeners,
        values: LocaleEnum.values);
  }

  late final EnumLocalObject<ThemeMode> themeModeLO;
  late final EnumLocalObject<LocaleEnum> localeLO;
}
