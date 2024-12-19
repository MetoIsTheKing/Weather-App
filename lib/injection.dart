import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/network_info.dart';
import 'package:weather_app/features/home/data/repository/current_weather_repo.dart';
import 'package:weather_app/features/home/data/services/caching_current_weather.dart';
import 'package:weather_app/features/home/data/services/current_weather_service.dart';
import 'package:weather_app/features/home/presentation/logic/cubit/current_weather_cubit.dart';

final currentWeatherDI = GetIt.instance;

Future<void> initCurrentWeatherDI() async {
  // cubit
  currentWeatherDI.registerFactory(() => CurrentWeatherCubit(
        currentWeatherRepo: currentWeatherDI(),));

  // repository
  currentWeatherDI.registerLazySingleton<CurrentWeatherRepo>(() => CurrentWeatherRepo(
        currentWeatherService: currentWeatherDI(),
        cachingCurrentWeather: currentWeatherDI(),
        networkInfo: currentWeatherDI(),
  ));

  // services
  currentWeatherDI.registerLazySingleton<CurrentWeatherService>(() => CurrentWeatherService());   

  // network info
  currentWeatherDI.registerLazySingleton<NetworkInfo>(() => NetworkInfo(
    connectionChecker: currentWeatherDI(),
  ));     

  // caching current weather
  currentWeatherDI.registerLazySingleton<CachingCurrentWeather>(() => CachingCurrentWeather(
    currentPref: currentWeatherDI(),
  ));

  // core
  final sharedPreferences = await SharedPreferences.getInstance();
  currentWeatherDI.registerLazySingleton(() => sharedPreferences);
  currentWeatherDI.registerLazySingleton(() => InternetConnectionChecker());
  
}
