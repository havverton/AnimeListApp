import 'package:auto_route/annotations.dart';

import '../pages/home/home_page.dart';
import 'routing.dart';

@MaterialAutoRouter(routes: [
  AutoRoute<void>(
    page: HomePage,
    initial: true,
    path: Routes.counter,
  ),
])
class $AppRouter {}
