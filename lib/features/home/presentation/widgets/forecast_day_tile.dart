import 'package:flutter/material.dart';
import 'package:weather_app/core/app_colors.dart';

class ForecastDayTile extends StatelessWidget {
  final String? day;
  final double? maxTemp;
  final double? minTemp;
  const ForecastDayTile({super.key, required this.day, required this.maxTemp, required this.minTemp});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: false,
      title:  Text(
        day!,
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
