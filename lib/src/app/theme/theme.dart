import 'package:flutter/material.dart';

import 'app_theme.dart';

ThemeData buildTheme(AppTheme theme) {
  final colorTheme = theme.colorTheme;
  final textTheme = theme.textTheme;

  return ThemeData(
    scaffoldBackgroundColor: colorTheme.background,
    colorScheme: ColorScheme(
      primary: colorTheme.primary,
      onPrimary: colorTheme.onPrimary,
      secondary: colorTheme.secondary,
      onSecondary: colorTheme.onSecondary,
      error: colorTheme.error,
      onError: colorTheme.onError,
      brightness: colorTheme.brightness,
      surface: colorTheme.surface,
      onSurface: colorTheme.onSurface,
      background: colorTheme.background,
      onBackground: colorTheme.onBackground,
    ),
    textTheme: TextTheme(
      headline5: textTheme.h5Medium,
      headline6: textTheme.h6Medium,
      bodyText1: textTheme.body1Medium,
      bodyText2: textTheme.body1Regular,
      button: textTheme.button,
    ),
  );
}
