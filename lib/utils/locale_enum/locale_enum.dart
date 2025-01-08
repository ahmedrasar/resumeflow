import 'package:flutter/material.dart';

enum LocaleEnum {
  system(null, null),
  english(Locale('en'), 'English'),
  arabic(Locale('ar'), 'عربي');

  final Locale? locale;
  final String? nativeName;
  const LocaleEnum(this.locale, this.nativeName);
}
