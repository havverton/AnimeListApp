import 'package:flutter/widgets.dart';
import 'adaptive_kit.dart';

class AdaptiveValueBuilder<T> extends StatelessWidget {
  const AdaptiveValueBuilder({
    required this.builder,
    Key? key,
    this.xxs,
    this.xs,
    this.s,
    this.m,
    this.lg,
    this.xl,
  })  : assert(
            xxs != null ||
                xs != null ||
                s != null ||
                m != null ||
                lg != null ||
                xl != null,
            'One breakpoint required'),
        super(key: key);

  final ValueBuilderFunction<T>? xxs;
  final ValueBuilderFunction<T>? xs;
  final ValueBuilderFunction<T>? s;
  final ValueBuilderFunction<T>? m;
  final ValueBuilderFunction<T>? lg;
  final ValueBuilderFunction<T>? xl;

  final AdaptiveWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      context.adaptiveValue<T>(
        xxs: xxs,
        xs: xs,
        s: s,
        m: m,
        lg: lg,
        xl: xl,
      ),
    );
  }
}
