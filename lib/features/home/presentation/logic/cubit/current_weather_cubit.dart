import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/repository/current_weather_repo.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final CurrentWeatherRepo currentWeatherRepo;
  CurrentWeatherCubit(this.currentWeatherRepo) : super(CurrentWeatherInitial());

  Future<void> getCurrentWeather({required String city}) async {
    emit(CurrentWeatherIsLoading());
    try {
      final currentWeather =
          await currentWeatherRepo.getCurrentWeather(city: city);
      emit(CurrentWeatherLoaded(currentWeather));
    } catch (e) {
      emit(CurrentWeatherError(errorMessage: 'Failed to fetch weather'));
      debugPrint(e.toString());
    }
  }
}
