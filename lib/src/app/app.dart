import 'package:flutter/material.dart';

import '../injection/injection.dart';
import 'localization/localization.dart';
import 'routing/routing.dart';
import 'theme/app_theme.dart';
import 'theme/app_theme_provider.dart';
import 'theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppThemeProvider(
      appTheme: AppTheme.defaultAppTheme(),
      child: Builder(builder: (context) {
        final theme = AppTheme.of(context);

        return MaterialApp.router(
          title: 'Flutter Template',
          theme: buildTheme(theme),
          localizationsDelegates: const [AppLocalization.delegate],
          supportedLocales: AppLocalization.supportedLocales,
          routeInformationParser:
              sl<AppRouter>().defaultRouteParser(includePrefixMatches: true),
          routerDelegate: sl<AppRouter>().delegate(),
        );
      }),
    );
  }
}
