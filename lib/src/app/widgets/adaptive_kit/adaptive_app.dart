import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'break_point.dart';

enum ScreenSize {
  //IPhone 5
  xxs,

  //IPhone 6, 7, 8
  xs,

  //IPhone 6+, 7+, 8, 10, 11
  s,

  // tablet
  m,

  //large tablet
  lg,

  // desktop
  xl,
}

class AdaptiveApp extends StatefulWidget {
  AdaptiveApp({
    required this.breakpoints,
    required this.child,
    this.initialScreenSize = ScreenSize.m,
    Key? key,
  })  : assert(breakpoints.isNotEmpty, 'breakpoints must be not empty'),
        super(key: key);

  final Widget child;
  final Map<ScreenSize, BreakPoint> breakpoints;
  final ScreenSize initialScreenSize;

  @override
  State<AdaptiveApp> createState() => _AdaptiveAppState();
}

class _AdaptiveAppState extends State<AdaptiveApp> {
  late ScreenSize _screenSize;

  @override
  void initState() {
    super.initState();
    _screenSize = widget.initialScreenSize;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _updateScreenSize();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateScreenSize() {
    _screenSize = _getScreenSize();
  }

  ScreenSize _getScreenSize() {
    final data = MediaQuery.of(context);

    final width = data.orientation == Orientation.portrait
        ? data.size.width
        : data.size.height;

    final entries = widget.breakpoints.entries;

    final result = entries.firstWhere((element) => element.value.active(width),
        orElse: () => entries.last);

    return result.key;
  }
  //
  // BreakPoint get _currentBreakpoint {
  //
  // }

  @override
  Widget build(BuildContext context) {
    return _AdaptiveAppProvider(
      breakpoints: widget.breakpoints,
      child: widget.child,
      screenSize: _screenSize,
    );
  }
}

class _AdaptiveAppProvider extends InheritedWidget {
  const _AdaptiveAppProvider({
    required this.child,
    required this.breakpoints,
    required this.screenSize,
    Key? key,
  }) : super(key: key, child: child);

  @override
  // ignore: overridden_fields
  final Widget child;

  final Map<ScreenSize, BreakPoint> breakpoints;
  final ScreenSize screenSize;

  static _AdaptiveAppProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_AdaptiveAppProvider>();
  }

  @override
  bool updateShouldNotify(_AdaptiveAppProvider oldWidget) {
    return oldWidget.screenSize != screenSize;
  }
}

class AdaptiveAppData {
  const AdaptiveAppData({
    required this.breakpoints,
    required this.screenSize,
  });

  final UnmodifiableMapView<ScreenSize, BreakPoint> breakpoints;
  final ScreenSize screenSize;

  factory AdaptiveAppData.of(BuildContext context) {
    final provider = _AdaptiveAppProvider.of(context);

    assert(provider != null, 'AdaptiveApp not found in widget tree');

    return AdaptiveAppData(
      breakpoints: UnmodifiableMapView(provider!.breakpoints),
      screenSize: provider.screenSize,
    );
  }
}
