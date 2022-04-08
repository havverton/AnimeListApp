import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'routing.dart';

class RouterLoggingObserver extends AutoRouterObserver {
  @protected
  final Logger logger;
  @protected
  final AppRouter appRouter;

  RouterLoggingObserver({
    required this.logger,
    required this.appRouter,
  });

  @override
  void didPush(Route route, Route? previousRoute) {
    logger.debug(
      'ROUTING New route pushed: ${route.settings.name}, stack${_stack()}',
    );
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    logger.debug(
      'ROUTING Route poped: ${route.settings.name}, stack${_stack()}',
    );
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    logger.debug(
      'ROUTING Route removed: ${route.settings.name}, stack${_stack()}',
    );
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    logger.debug(
      'ROUTING Route replaced to: ${newRoute?.settings.name} from: ${oldRoute?.settings.name}, stack${_stack()}',
    );
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    logger.debug(
      'ROUTING Tab route visited: ${route.name}, stack${_stack()}',
    );
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    logger.debug(
      'ROUTING Tab route re-visited: ${route.name}, stack${_stack()}',
    );
  }

  String _stack() => appRouter.stack.map((it) => it.name).toString();
}
