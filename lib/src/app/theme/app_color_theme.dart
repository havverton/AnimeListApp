import 'package:flutter/material.dart';

import './colors.dart';

abstract class AppColorTheme {
  factory AppColorTheme.defaultAppColors() {
    return _DefaultColorTheme();
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

class _DefaultColorTheme implements AppColorTheme {
  //============================== Main Colors ==============================
  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get primary => AppColorPalette.seance;

  @override
  Color get secondary => AppColorPalette.seance;

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
  Color get onSurface => AppColorPalette.woodsmoke;

  //============================== Typography Colors ==============================
  @override
  Color get textPrimary => AppColorPalette.woodsmoke;

  //============================== Background Colors ==============================

  @override
  Color get background => Colors.grey;

  @override
  Color get onBackground => AppColorPalette.woodsmoke;

  //============================== Stroke Colors ==============================
  @override
  Color get strokePrimary => Colors.grey;
}
