import 'package:flutter/material.dart';
import 'package:weather_app/core/app_colors.dart';

class ForecastDayTile extends StatelessWidget {
  final String day;
  final String image;
  final String maxTemp;
  final String minTemp;
  const ForecastDayTile({super.key, required this.day, required this.maxTemp, required this.minTemp, required this.image});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: false,
      leading: Image.asset(image),
      title:  Text(
        day,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.appDarkBlue),
      ),
      trailing:  Text(
        '$maxTemp°C/$minTemp °C',
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.appDarkBlue),
      ),
    );
  }
}
