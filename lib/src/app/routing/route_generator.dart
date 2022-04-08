import 'package:flutter/cupertino.dart';

import '../pages/home/home_page.dart';
import 'routes.dart';

abstract class RouteGenerator {
  static Route<T> transitionBuilder<T>(
      WidgetBuilder builder, RouteSettings settings) {
    return CupertinoPageRoute(builder: builder, settings: settings);
  }

  static Route<T> generateRoute<T>(RouteSettings settings) {
    switch (settings.name) {
      case Routes.counter:
        return transitionBuilder((_) => const HomePage(), settings);

      default:
        return transitionBuilder((_) => Container(), settings);
    }
  }
}
