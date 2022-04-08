import 'package:flutter/material.dart';

import 'src/app/app.dart';
import 'src/injection/injection.dart';

void main() {
  initInjection();
  runApp(const App());
}
