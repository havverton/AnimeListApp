import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'routing/routing.dart';
import 'theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Template',
      theme: lightTheme(),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Routes.counter,
    );
  }
}
