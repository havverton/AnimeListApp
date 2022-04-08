import 'package:flutter/material.dart';
import 'adaptive_kit.dart';

extension AdaptiveUtils on BuildContext {
  T adaptiveValue<T>(
      {ValueBuilderFunction<T>? xxs,
      ValueBuilderFunction<T>? xs,
      ValueBuilderFunction<T>? s,
      ValueBuilderFunction<T>? m,
      ValueBuilderFunction<T>? lg,
      ValueBuilderFunction<T>? xl}) {
    final values = <ScreenSize, ValueBuilderFunction<T>?>{
      ScreenSize.xxs: xxs,
      ScreenSize.xs: xs,
      ScreenSize.s: s,
      ScreenSize.m: m,
      ScreenSize.lg: lg,
      ScreenSize.xl: xl,
    };

    final data = AdaptiveAppData.of(this);

    if (values[data.screenSize] != null) {
      return values[data.screenSize]!.call(this);
    }

    _ensureOder();

    return getClosestValue(values, data.screenSize)(this);
  }

  T adaptive<T>({T? xxs, T? xs, T? s, T? m, T? lg, T? xl}) {
    final values = <ScreenSize, T?>{
      ScreenSize.xxs: xxs,
      ScreenSize.xs: xs,
      ScreenSize.s: s,
      ScreenSize.m: m,
      ScreenSize.lg: lg,
      ScreenSize.xl: xl,
    };

    final data = AdaptiveAppData.of(this);

    if (values[data.screenSize] != null) {
      return values[data.screenSize]!;
    }

    _ensureOder();

    return getClosestValue(values, data.screenSize);
  }

  void _ensureOder() {
    const message = 'Wrong order';
    assert(ScreenSize.xxs.index == 0, message);
    assert(ScreenSize.xs.index == 1, message);
    assert(ScreenSize.s.index == 2, message);
    assert(ScreenSize.m.index == 3, message);
    assert(ScreenSize.lg.index == 4, message);
    assert(ScreenSize.xl.index == 5, message);
  }
}

T getClosestValue<T>(Map<ScreenSize, T?> map, ScreenSize screenSize) {
  T? foundedValue;

  for (final entry in map.entries) {
    if (entry.value != null) {
      foundedValue = entry.value;
    }

    if (entry.key.index >= screenSize.index && foundedValue != null) {
      return foundedValue;
    }
  }

  throw Exception('Value not found');
}
