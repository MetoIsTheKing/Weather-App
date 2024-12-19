import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/home/data/repository/forecast_weather_repo.dart';

part 'forecast_weather_state.dart';

class ForecastWeatherCubit extends Cubit<ForecastWeatherState> {
  final ForecastWeatherRepo forecastWeatherRepo;
  ForecastWeatherCubit({required this.forecastWeatherRepo}) : super(ForecastWeatherInitial());

  Future<void> getForecastWeather({required String city, required String days}) async {
    emit(ForecastWeatherIsLoading());
    try {
      final forecastWeather = await forecastWeatherRepo.getForecastWeather(city: city, days: days);
      emit(ForecastWeatherLoaded(forecastWeather));
    } catch (e) {
      emit(ForecastWeatherError(errorMessage: e.toString()));
    }
  }
}