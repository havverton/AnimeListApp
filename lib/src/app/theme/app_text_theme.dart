import 'package:flutter/rendering.dart';

abstract class AppTextTheme {
  factory AppTextTheme.defaultTextTheme() {
    return _BaseAppTextTheme();
  }

  //----------h6-------------//

  TextStyle get h6Medium;

  TextStyle get h6Regular;

  //----------h5-------------//

  TextStyle get h5Medium;

  TextStyle get h5Regular;

  //----------body-------------//
  TextStyle get body1Medium;

  TextStyle get body1Regular;

  //----------button-------------//
  TextStyle get button;

  //----------captions & subtitle-------------//
  // TextStyle get caption1Regular;

  // TextStyle get caption2Regular;

  // TextStyle get subtitle2Bold;

  // TextStyle get subtitle2Medium;

  // TextStyle get subtitle2Regular;
}

class _BaseAppTextTheme implements AppTextTheme {
  //----------h6-------------//
  //TextStyle get h6Bold;

  @override
  TextStyle get h6Medium => h6Regular.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get h6Regular => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      );

  //----------h5-------------//
  //TextStyle get h5Bold => h5Regular.copyWith(fontWeight: FontWeight.w700);

  @override
  TextStyle get h5Medium => h5Regular.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get h5Regular => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      );

  //----------body-------------//
  @override
  TextStyle get body1Medium =>
      body1Regular.copyWith(fontWeight: FontWeight.w500);

  @override
  TextStyle get body1Regular => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      );

  //----------button-------------//
  @override
  TextStyle get button => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
}
