import 'package:flutter/widgets.dart';
import 'adaptive_kit.dart';

class AdaptiveBuilder extends StatelessWidget {
  const AdaptiveBuilder({
    Key? key,
    this.defaultScreenSize = ScreenSize.m,
    this.xxs,
    this.xs,
    this.s,
    this.m,
    this.lg,
    this.xl,
  }) : super(key: key);

  final ValueBuilderFunction<Widget>? xxs;
  final ValueBuilderFunction<Widget>? xs;
  final ValueBuilderFunction<Widget>? s;
  final ValueBuilderFunction<Widget>? m;
  final ValueBuilderFunction<Widget>? lg;
  final ValueBuilderFunction<Widget>? xl;

  final ScreenSize defaultScreenSize;

  @override
  Widget build(BuildContext context) {
    return context.adaptiveValue<Widget>(
      xxs: xxs,
      xs: xs,
      s: s,
      m: m,
      lg: lg,
      xl: xl,
    );
  }
}
