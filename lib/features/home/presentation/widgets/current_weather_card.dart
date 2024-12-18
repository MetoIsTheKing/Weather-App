import 'package:flutter/material.dart';
import 'package:weather_app/core/app_colors.dart';
import 'package:weather_app/features/home/presentation/widgets/icon_row.dart';

class CurrentWeatherCard extends StatefulWidget {
  final String weatherStatus;
  final String location;
  final String statusIcon;
  final double temp;
  final int humidity;
  final double uv;
  final double windSpeed;
  const CurrentWeatherCard(
      {super.key,
      required this.weatherStatus,
      required this.location,
      required this.temp,
      required this.humidity,
      required this.uv,
      required this.windSpeed,
      required this.statusIcon});

  @override
  State<CurrentWeatherCard> createState() => _CurrentWeatherCardState();
}

class _CurrentWeatherCardState extends State<CurrentWeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.28,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.appBlue,
            AppColors.appLightBlue,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.weatherStatus,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appWhite,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Image.asset('assets/images/location.png'),
                        ),
                        Text(
                          widget.location,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.appWhite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Image.network(
                    widget.statusIcon,
                    fit: BoxFit.cover,
                    scale: 2,
                  )),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${widget.temp} °C',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.appWhite,
                    ),
                  ),
                  IconRow(
                      icon: 'assets/images/humidity.png',
                      value: '${widget.humidity}%'),
                  IconRow(icon: 'assets/images/uv.png', value: '${widget.uv}'),
                  IconRow(
                      icon: 'assets/images/wind.png',
                      value: '${widget.windSpeed}mp/h'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
