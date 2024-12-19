part of 'forecast_weather_cubit.dart';

@immutable
sealed class ForecastWeatherState {}

final class ForecastWeatherInitial extends ForecastWeatherState {}
final class ForecastWeatherIsLoading extends ForecastWeatherState {}
final class ForecastWeatherLoaded extends ForecastWeatherState {
  final ForecastWeatherModel forecastWeatherModel;
  ForecastWeatherLoaded(this.forecastWeatherModel);
}
final class ForecastWeatherError extends ForecastWeatherState {
  final String errorMessage;
  ForecastWeatherError({required this.errorMessage});
}
