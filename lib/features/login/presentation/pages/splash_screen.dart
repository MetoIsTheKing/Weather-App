import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/app_colors.dart';
import 'package:weather_app/core/app_strings.dart';

import '../../../../config/app_routes.dart';
import '../../business_logic/cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..startSplashTimer(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashLoaded) {
            Navigator.pushReplacementNamed(context, Routes.logIn);
          }
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.appLightBlue, // Light Blue at the top
                  AppColors.appBlue, // Dark Blue at the bottom
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cloud.png',
                ),
                const Text(
                  AppStrings.appName,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appWhite,
                      fontFamily: AppStrings.fontFamily
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Don\'t worry about\nThe weather we\'re all here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}