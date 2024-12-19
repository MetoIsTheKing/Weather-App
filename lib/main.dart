import 'dart:io';
import 'injection.dart' as di;
import 'package:flutter/material.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/features/home/data/services/current_weather_service.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await di.initCurrentWeatherDI();
  runApp(const WeatherApp());
}


