import 'package:flutter/material.dart';
import 'package:weather_app/core/network_info.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/home/data/services/caching_forecast_weather.dart';
import 'package:weather_app/features/home/data/services/forecast_weather_service.dart';

class ForecastWeatherRepo {
  final NetworkInfo networkInfo;
  final CachingForecastWeather cachingForecastWeather;
  final ForecastWeatherService forecastWeatherService;
  ForecastWeatherRepo({required this.networkInfo, required this.cachingForecastWeather, required this.forecastWeatherService});

  Future<ForecastWeatherModel> getForecastWeather({required String city, required String days}) async {
    if (await networkInfo.isConnected) {
      try {
        final forecastWeather = await forecastWeatherService.getForecastWeather(city: city, days: days);
        await cachingForecastWeather.cacheForecastWeather(forecastWeather);
        return forecastWeather;
      } catch (e) {
        debugPrint('Error in getForecastWeather: $e');
        throw Exception(e);
      }
    } else {
      try {
        final cachedForecastWeather = await cachingForecastWeather.getCachedForecastWeather();
        return cachedForecastWeather;
      } catch (e) {
        debugPrint('Error fetching cached forecast weather: $e');
        throw Exception(e);
      }
    }
  }
}