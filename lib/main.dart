import 'package:flutter/material.dart';

import 'src/app/app.dart';
import 'src/injection/injection.dart';

Future<void> main() async {
  await initInjection();
  runApp(const App());
}
