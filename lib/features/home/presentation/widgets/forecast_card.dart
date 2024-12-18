import 'package:flutter/material.dart';
import 'package:weather_app/core/app_colors.dart';
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
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.appWhite),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ForecastDayTile(
              day: 'Monday',
              maxTemp: '30',
              minTemp: '20',
              image: 'assets/images/sunn.png',
            ),
            ForecastDayTile(
              day: 'Monday',
              maxTemp: '30',
              minTemp: '20',
              image: 'assets/images/sunn.png',
            ),
            ForecastDayTile(
              day: 'Monday',
              maxTemp: '30',
              minTemp: '20',
              image: 'assets/images/sunn.png',
            ),
            ForecastDayTile(
              day: 'Monday',
              maxTemp: '30',
              minTemp: '20',
              image: 'assets/images/sunn.png',
            ),
            ForecastDayTile(
              day: 'Monday',
              maxTemp: '30',
              minTemp: '20',
              image: 'assets/images/sunn.png',
            ),
          ],
        ));
  }
}
