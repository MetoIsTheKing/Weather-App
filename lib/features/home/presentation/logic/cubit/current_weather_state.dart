part of 'current_weather_cubit.dart';

@immutable
sealed class CurrentWeatherState {
  get currentWeatherModel => null;
}

final class CurrentWeatherInitial extends CurrentWeatherState {}

final class CurrentWeatherIsLoading extends CurrentWeatherState {}
final class CurrentWeatherConnectionError extends CurrentWeatherState {}
final class CurrentWeatherHasConnection extends CurrentWeatherState {}

final class CurrentWeatherError extends CurrentWeatherState {
  final String errorMessage;
  CurrentWeatherError({required this.errorMessage});
}

final class CurrentWeatherLoaded extends CurrentWeatherState {
  @override
  final CurrentWeatherModel currentWeatherModel;
  CurrentWeatherLoaded( this.currentWeatherModel);
}
