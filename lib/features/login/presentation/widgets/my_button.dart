import 'package:flutter/material.dart';
import 'package:weather_app/core/app_colors.dart';
import 'package:weather_app/core/app_strings.dart';

class MyButton extends StatelessWidget {

  final VoidCallback onPressed;
  final List<Color>? colors;
  final String text;

  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.colors,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: colors?? const [
                AppColors.appBlue,
                AppColors.appBlue,
                AppColors.appLightBlue,
              ]
          )
        ),
        child: Center(
          child: Text(
              text,
            style: const TextStyle(
              fontFamily: AppStrings.fontFamily,
              color: AppColors.appWhite
            ),
          ),
        ),
      ),
    );
  }
}
