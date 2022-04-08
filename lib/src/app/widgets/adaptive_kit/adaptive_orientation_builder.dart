import 'package:flutter/widgets.dart';

import 'adaptive_kit.dart';

class AdaptiveOrientationBuilder extends StatelessWidget {
  const AdaptiveOrientationBuilder({
    required this.landscape,
    required this.portrait,
    this.builder,
    Key? key,
  }) : super(key: key);

  final ValueBuilderFunction<Widget> landscape;
  final ValueBuilderFunction<Widget> portrait;
  final AdaptiveWidgetBuilder<Widget>? builder;

  @override
  Widget build(BuildContext context) {
    return AdaptiveOrientationValueBuilder<Widget>(
      builder: builder ?? (context, widget) => widget,
      landscape: landscape,
      portrait: portrait,
    );
  }
}
