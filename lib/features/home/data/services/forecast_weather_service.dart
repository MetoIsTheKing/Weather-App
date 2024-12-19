import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/endpoints.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';

class ForecastWeatherService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'}));

  Future<ForecastWeatherModel> getForecastWeather({required String city, required String days}) async {
    try {
      final response = await dio.get(
        Endpoints.forecastWeather,
        queryParameters: {
          'q': city,
          'key': '90a5cc24de2b423d9d7215125241612',
          'days': days,
        },
      );
      debugPrint('Response Data: ${response.data}');
      return ForecastWeatherModel.fromJson(response.data);
    } catch (e) {
      debugPrint('Error fetching forecast weather: $e');
      throw Exception('Error fetching forecast weather: $e');
    }
  }
}