import 'package:flutter/material.dart';
import 'package:weather_app/config/app_theme.dart';
import 'package:weather_app/features/details/presentation/pages/details_page.dart';
import 'package:weather_app/features/drawer/presentation/drawer_page/my_drawer.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      home: AdvancedDrawerExample(
        child: DetailsPage(),
      )
    );
  }
}