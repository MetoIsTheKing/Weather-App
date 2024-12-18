import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/services/current_weather_service.dart';

class CurrentWeatherRepo {
  final CurrentWeatherService currentWeatherService;
  CurrentWeatherRepo( this.currentWeatherService);

  Future<CurrentWeatherModel> getCurrentWeather({required String city})async{
    return await currentWeatherService.getCurrentWeather(city: city);
  }
  
}