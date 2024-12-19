 import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';

const String currentWeatherCacheKey = 'CURRENT_WEATHER_CACHED_KEY';

class CachingCurrentWeather {
  final SharedPreferences currentPref;

  CachingCurrentWeather({required this.currentPref});

  Future<void> cacheCurrentWeather(CurrentWeatherModel currentWeather) async {
    final jsonString = json.encode(currentWeather.toJson());
    await currentPref.setString(currentWeatherCacheKey, jsonString);
  }

  Future<CurrentWeatherModel> getCachedCurrentWeather() async {
    final cachedCurrentWeather = currentPref.getString(currentWeatherCacheKey);
    if (cachedCurrentWeather != null) {
      final jsonData = json.decode(cachedCurrentWeather);
      return CurrentWeatherModel.fromJson(jsonData);
    } else {
      throw Exception('No cached current weather found');
    }
  }
 
  
}
