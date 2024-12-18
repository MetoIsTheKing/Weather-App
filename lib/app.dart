import 'package:flutter/material.dart';
import 'package:weather_app/config/app_routes.dart';
import 'package:weather_app/config/app_theme.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(),
      initialRoute: Routes.homePage,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
