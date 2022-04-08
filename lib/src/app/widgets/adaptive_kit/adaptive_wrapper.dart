import 'package:flutter/material.dart';

import 'extension.dart';

typedef AdaptiveWrapperBuilder = Widget Function(BuildContext, Widget);

class AdaptiveWrapper extends StatelessWidget {
  const AdaptiveWrapper({
    required this.child,
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

  final AdaptiveWrapperBuilder? xxs;
  final AdaptiveWrapperBuilder? xs;
  final AdaptiveWrapperBuilder? s;
  final AdaptiveWrapperBuilder? m;
  final AdaptiveWrapperBuilder? lg;
  final AdaptiveWrapperBuilder? xl;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final builder = context.adaptive<AdaptiveWrapperBuilder>(
      xxs: xxs,
      xs: xs,
      s: s,
      m: m,
      lg: lg,
      xl: xl,
    );

    return builder(context, child);
  }
}
