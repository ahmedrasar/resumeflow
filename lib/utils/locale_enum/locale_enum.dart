import 'package:flutter/material.dart';

enum LocaleEnum {
  system(null),
  english(Locale('en')),
  arabic(Locale('ar'));

  final Locale? locale;
  const LocaleEnum(this.locale);
}
