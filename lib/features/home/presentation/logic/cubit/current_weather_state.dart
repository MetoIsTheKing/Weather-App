part of 'current_weather_cubit.dart';

@immutable
sealed class CurrentWeatherState {}

final class CurrentWeatherInitial extends CurrentWeatherState {}

final class CurrentWeatherIsLoading extends CurrentWeatherState {}

final class CurrentWeatherError extends CurrentWeatherState {
  final String errorMessage;
  CurrentWeatherError({required this.errorMessage});
}

final class CurrentWeatherLoaded extends CurrentWeatherState {
  final CurrentWeatherModel currentWeatherModel;
  CurrentWeatherLoaded( this.currentWeatherModel);
}
