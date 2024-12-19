import 'package:weather_app/core/network_info.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/services/caching_current_weather.dart';
import 'package:weather_app/features/home/data/services/current_weather_service.dart';

class CurrentWeatherRepo {
  final NetworkInfo networkInfo;
  final CachingCurrentWeather cachingCurrentWeather;
  final CurrentWeatherService currentWeatherService;
  CurrentWeatherRepo({required this.networkInfo, required this.cachingCurrentWeather, required this.currentWeatherService, });

  Future<CurrentWeatherModel> getCurrentWeather({required String city})async{
    if(await networkInfo.isConnected){
      try {
        final currentWeather = await currentWeatherService.getCurrentWeather(city: city);
        await cachingCurrentWeather.cacheCurrentWeather(currentWeather);
        return currentWeather;
      } catch (e) {
        throw Exception(e);
      }
    }else{
      try {
        final cachedCurrentWeather = await cachingCurrentWeather.getCachedCurrentWeather();
        return cachedCurrentWeather;
      } catch (e) {
        throw Exception(e);
        
      }
    }
  }
  
}