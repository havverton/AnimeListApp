import 'package:flutter/widgets.dart';

import 'adaptive_kit.dart';

class AdaptiveOrientationValueBuilder<T> extends StatelessWidget {
  const AdaptiveOrientationValueBuilder({
    required this.builder,
    required this.landscape,
    required this.portrait,
    Key? key,
  }) : super(key: key);

  final ValueBuilderFunction<T> landscape;
  final ValueBuilderFunction<T> portrait;
  final AdaptiveWidgetBuilder<T> builder;

  T _getValue(BuildContext context, Orientation orientation) {
    if (orientation == Orientation.landscape) {
      return landscape(context);
    }

    return portrait(context);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return builder(context, _getValue(context, orientation));
    });
  }
}
