import 'package:flutter/material.dart';

import 'common_theme.dart';

final lightTheme = commonTheme.copyWith(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(),
  textTheme: commonTextTheme(Colors.black),
);
