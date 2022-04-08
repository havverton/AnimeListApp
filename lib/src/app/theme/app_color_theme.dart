import 'package:flutter/material.dart';

import './colors.dart';

abstract class AppColorTheme {
  factory AppColorTheme.light() {
    return _LightColorTheme();
  }

  //============================== Main Colors ==============================
  Brightness get brightness;

  Color get primary;

  Color get onPrimary;

  Color get secondary;

  Color get onSecondary;

  Color get error;

  Color get onError;

  Color get surface;

  Color get onSurface;

  //============================== Typography Colors ==============================

  Color get textPrimary;

  //============================== Background Colors ==============================

  Color get background;

  Color get onBackground;

  //============================== Stroke Colors ==============================
  Color get strokePrimary;
}

class _LightColorTheme implements AppColorTheme {
  //============================== Main Colors ==============================
  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get primary => AppColorPalette.black;

  @override
  Color get secondary => AppColorPalette.black;

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get onSecondary => Colors.white;

  @override
  Color get error => Colors.red;

  @override
  Color get onError => Colors.white;

  @override
  Color get surface => Colors.white;

  @override
  Color get onSurface => AppColorPalette.black;

  //============================== Typography Colors ==============================
  @override
  Color get textPrimary => AppColorPalette.black;

  //============================== Background Colors ==============================

  @override
  Color get background => Colors.grey;

  @override
  Color get onBackground => AppColorPalette.black;

  //============================== Stroke Colors ==============================
  @override
  Color get strokePrimary => Colors.grey;
}
