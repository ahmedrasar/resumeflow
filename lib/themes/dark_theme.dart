import 'package:flutter/material.dart';

import 'common_theme.dart';

final darkTheme = commonTheme.copyWith(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(),
  textTheme: commonTextTheme(Colors.white),
);
