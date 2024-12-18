import 'package:flutter/material.dart';
import 'package:weather_app/core/app_colors.dart';

class ErrorTile extends StatelessWidget {
  const ErrorTile({super.key});

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
      child: const Center(child: Text('Oops !! Something went wrong')),
    );
  }
}
