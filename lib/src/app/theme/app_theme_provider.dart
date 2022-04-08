import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeProvider extends InheritedWidget {
  const AppThemeProvider({
    required this.child,
    required this.appTheme,
    Key? key,
  }) : super(key: key, child: child);

  @override
  // ignore: overridden_fields
  final Widget child;

  final AppTheme appTheme;

  static AppTheme? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppThemeProvider>()
        ?.appTheme;
  }

  @override
  bool updateShouldNotify(AppThemeProvider oldWidget) {
    return oldWidget.appTheme != appTheme;
  }
}
