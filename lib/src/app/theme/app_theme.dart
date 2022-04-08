import 'package:flutter/material.dart';

import 'app_color_theme.dart';
import 'app_text_theme.dart';
import 'app_theme_provider.dart';

abstract class AppTheme {
  factory AppTheme({
    required AppColorTheme colorTheme,
    required AppTextTheme textTheme,
  }) = _AppTheme;

  factory AppTheme.defaultAppTheme() {
    return _AppTheme(
      colorTheme: AppColorTheme.defaultAppColors(),
      textTheme: AppTextTheme.defaultTextTheme(),
    );
  }

  AppColorTheme get colorTheme;
  AppTextTheme get textTheme;

  static AppTheme of(BuildContext context) => AppThemeProvider.of(context)!;
}

class _AppTheme implements AppTheme {
  const _AppTheme({
    required this.colorTheme,
    required this.textTheme,
  });

  @override
  final AppColorTheme colorTheme;

  @override
  final AppTextTheme textTheme;
}
