
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/endpoints.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';

class CurrentWeatherService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'}));

  Future<CurrentWeatherModel> getCurrentWeather({required String city}) async {
    try {
      final response = await dio.get(
        Endpoints.forecastWeather,
        queryParameters: {
          'q': city,
          'key': '90a5cc24de2b423d9d7215125241612',
          'days': '3',
        },
      );
      debugPrint('Response Data: ${response.data}');
      debugPrint('Condition JSON: ${response.data['current']['condition']}');
      return CurrentWeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('error fetching current weather : $e');
    }
  }
}
