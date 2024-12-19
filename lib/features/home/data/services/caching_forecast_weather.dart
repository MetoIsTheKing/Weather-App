import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';

const String forecastWeatherCacheKey = 'FORECAST_WEATHER_CACHED_KEY';
class CachingForecastWeather {
 final SharedPreferences forecastPref;

  CachingForecastWeather({required this.forecastPref});

  Future<void> cacheForecastWeather(ForecastWeatherModel forecastWeather) async {
    final jsonString = json.encode(forecastWeather.toJson());
    await forecastPref.setString(forecastWeatherCacheKey, jsonString);
  }

  Future<ForecastWeatherModel> getCachedForecastWeather() async {
    final cachedForecastWeather = forecastPref.getString(forecastWeatherCacheKey);
    if (cachedForecastWeather != null) {
      final jsonData = json.decode(cachedForecastWeather);
      return ForecastWeatherModel.fromJson(jsonData);
    } else {
      throw Exception('No cached current weather found');
    }
  }
}