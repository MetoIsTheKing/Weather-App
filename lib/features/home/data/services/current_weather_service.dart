import 'dart:io';

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
        Endpoints.currentWeather,
        queryParameters: {
          'q': city,
          'key': '90a5cc24de2b423d9d7215125241612',
        },
      );
      debugPrint('Response Data: ${response.data}');
      debugPrint('Condition JSON: ${response.data['current']['condition']}');
      return CurrentWeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('error fetching current weather : $e');
    }
  }

  void setupInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          debugPrint("Request: ${options.method} ${options.uri}");
          debugPrint("Headers: ${options.headers}");
          debugPrint("Body: ${options.data}");
          handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          debugPrint("Response: ${response.statusCode} ${response.data}");
          handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          debugPrint("Error: ${e.response?.statusCode} ${e.response?.data}");
          handler.next(e);
        },
      ),
    );
  }
}

//ssl certificate
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
