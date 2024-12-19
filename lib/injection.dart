import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/network_info.dart';
import 'package:weather_app/features/home/data/repository/current_weather_repo.dart';
import 'package:weather_app/features/home/data/repository/forecast_weather_repo.dart';
import 'package:weather_app/features/home/data/services/caching_current_weather.dart';
import 'package:weather_app/features/home/data/services/caching_forecast_weather.dart';
import 'package:weather_app/features/home/data/services/current_weather_service.dart';
import 'package:weather_app/features/home/data/services/forecast_weather_service.dart';
import 'package:weather_app/features/home/presentation/logic/cubit/current_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/logic/forecast_logic/cubit/forecast_weather_cubit.dart';

final currentWeatherDI = GetIt.instance;

Future<void> initCurrentWeatherDI() async {
  // current weather cubit
  currentWeatherDI.registerFactory(() => CurrentWeatherCubit(
        currentWeatherRepo: currentWeatherDI(),
      ));

  // forecast weather cubit
  currentWeatherDI.registerFactory(() => ForecastWeatherCubit(
        forecastWeatherRepo: currentWeatherDI(),
      ));

  // current weather repository
  currentWeatherDI
      .registerLazySingleton<CurrentWeatherRepo>(() => CurrentWeatherRepo(
            currentWeatherService: currentWeatherDI(),
            cachingCurrentWeather: currentWeatherDI(),
            networkInfo: currentWeatherDI(),
          ));

  // forecast weather repository
  currentWeatherDI
      .registerLazySingleton<ForecastWeatherRepo>(() => ForecastWeatherRepo(
            forecastWeatherService: currentWeatherDI(),
            networkInfo: currentWeatherDI(),
            cachingForecastWeather: currentWeatherDI(),
          ));

  // current weather service
  currentWeatherDI.registerLazySingleton<CurrentWeatherService>(
      () => CurrentWeatherService());

  // forecast weather service
   currentWeatherDI.registerLazySingleton<ForecastWeatherService>(
       () => ForecastWeatherService()); 

  // network info
  currentWeatherDI.registerLazySingleton<NetworkInfo>(() => NetworkInfo(
        connectionChecker: currentWeatherDI(),
      ));

  // caching current weather
  currentWeatherDI
      .registerLazySingleton<CachingCurrentWeather>(() => CachingCurrentWeather(
            currentPref: currentWeatherDI(),
          ));

  // caching forecast weather
   currentWeatherDI.registerLazySingleton<CachingForecastWeather>(
       () => CachingForecastWeather(
             forecastPref: currentWeatherDI(),
           ));        

  // core
  final sharedPreferences = await SharedPreferences.getInstance();
  currentWeatherDI.registerLazySingleton(() => sharedPreferences);
  currentWeatherDI.registerLazySingleton(() => InternetConnectionChecker());
}
