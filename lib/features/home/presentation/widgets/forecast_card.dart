import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/app_colors.dart';
import 'package:weather_app/features/home/presentation/logic/forecast_logic/cubit/forecast_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/widgets/forecast_day_tile.dart';

class ForecastCard extends StatefulWidget {
  const ForecastCard({super.key});

  @override
  State<ForecastCard> createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.appWhite),
        child: BlocBuilder<ForecastWeatherCubit, ForecastWeatherState>(
          builder: (context, state) {
            if (state is ForecastWeatherLoaded) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ForecastDayTile(
                    day: state
                        .forecastWeatherModel.forecast.forecastday[index].date
                        .toString(),
                    maxTemp: state.forecastWeatherModel.forecast
                        .forecastday[index].day.maxtempC,
                    minTemp: state.forecastWeatherModel.forecast
                        .forecastday[index].day.mintempC,
                  );
                },
              );
            } else if (state is ForecastWeatherError) {
              return const Center(
                child: Text('Failed to fetch forecast'),
              );
            } else if (state is ForecastWeatherIsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
