import 'package:flutter/material.dart';

import 'common_theme.dart';

final darkTheme = commonTheme.copyWith(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(),
  iconTheme: IconThemeData(color: Colors.white),
  textTheme: commonTextTheme(Colors.white),
);
