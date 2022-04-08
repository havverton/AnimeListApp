import 'package:flutter/material.dart';

import '../../../injection/injection.dart';
import '../../../modules/weather/data/weather_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _getWeather() async {
    final repo = sl<WeatherRepository>();

    final result = await repo.getForecast('Ternopil');
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(onTap: _getWeather),
    );
  }
}
