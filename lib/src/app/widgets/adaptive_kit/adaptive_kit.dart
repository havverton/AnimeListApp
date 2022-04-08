import 'package:flutter/widgets.dart';

export 'adaptive_app.dart';
export 'adaptive_builder.dart';
export 'adaptive_orientation_builder.dart';
export 'adaptive_orientation_value_builder.dart';
export 'adaptive_value_builder.dart';
export 'adaptive_wrapper.dart';
export 'break_point.dart';
export 'extension.dart';

typedef ValueBuilderFunction<T> = T Function(BuildContext context);

typedef AdaptiveWidgetBuilder<T> = Widget Function(
    BuildContext context, T value);
