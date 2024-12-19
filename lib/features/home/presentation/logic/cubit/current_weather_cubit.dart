import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/repository/current_weather_repo.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final CurrentWeatherRepo currentWeatherRepo;
  CurrentWeatherCubit({required this.currentWeatherRepo})
      : super(CurrentWeatherInitial());

  Future<void> getCurrentWeather({required String city}) async {
    try {
      final hasConnection = await currentWeatherRepo.networkInfo.isConnected;
      if (hasConnection) {
        emit(CurrentWeatherHasConnection());
        emit(CurrentWeatherIsLoading());
        final currentWeather =
            await currentWeatherRepo.getCurrentWeather(city: city);
        emit(CurrentWeatherLoaded(currentWeather));
      }else{
        emit(CurrentWeatherConnectionError());
        final cachedWeather = await currentWeatherRepo.cachingCurrentWeather
            .getCachedCurrentWeather();
        emit(CurrentWeatherLoaded(cachedWeather));
      }
    } catch (e) {
      
      emit(CurrentWeatherError(errorMessage: 'Failed to fetch weather'));
      debugPrint(e.toString());
    }
  }

}
