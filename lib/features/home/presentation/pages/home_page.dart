import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/app_colors.dart';
import 'package:weather_app/features/home/data/services/current_weather_service.dart';
import 'package:weather_app/features/home/presentation/logic/cubit/current_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/widgets/current_weather_card.dart';
import 'package:weather_app/features/home/presentation/widgets/error_tile.dart';
import 'package:weather_app/features/home/presentation/widgets/forecast_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CurrentWeatherCubit>(context)
        .getCurrentWeather(city: 'London');
    CurrentWeatherService().setupInterceptors();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 217, 217),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 220, 217, 217),
        title: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
          builder: (context, state) {
            if (state is CurrentWeatherLoaded) {
              return Text(state
                  .currentWeatherModel.location.name); // Use dynamic location
            }
            return const Text('Weather'); // Fallback text
          },
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/images/drawer.png'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/search.png'),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          clipBehavior: Clip.antiAlias,
          physics: const BouncingScrollPhysics(),
          children: [
            BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
              builder: (context, state) {
                if (state is CurrentWeatherIsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CurrentWeatherLoaded) {
                  final iconUrl =
                      state.currentWeatherModel.current.condition.icon;
                  final fullUrl =
                      iconUrl.startsWith('http') ? iconUrl : 'https:$iconUrl';
                  return CurrentWeatherCard(
                    weatherStatus:
                        state.currentWeatherModel.current.condition.text,
                    location: state.currentWeatherModel.location.country,
                    temp: state.currentWeatherModel.current.tempC,
                    humidity: state.currentWeatherModel.current.humidity,
                    uv: state.currentWeatherModel.current.uv,
                    windSpeed: state.currentWeatherModel.current.windKph,
                    statusIcon: fullUrl,
                  );
                } else if (state is CurrentWeatherError) {
                  return const ErrorTile();
                } else {
                  return const Center(child: Text('Empty'));
                }
              },
            ),
            const SizedBox(height: 25),
            const Text(
              'Forecast',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.appDarkBlue),
            ),
            const SizedBox(height: 10),
            const ForecastCard(),
          ],
        ),
      ),
    );
  }
}
