import 'package:flutter/material.dart';

import 'common_theme.dart';

final lightTheme = commonTheme.copyWith(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(),
  iconTheme: IconThemeData(color: Colors.black),
  cardColor: Colors.white70,
  textTheme: commonTextTheme(Colors.black),
);
