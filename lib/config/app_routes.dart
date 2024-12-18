import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/data/repository/current_weather_repo.dart';
import 'package:weather_app/features/home/data/services/current_weather_service.dart';
import 'package:weather_app/features/home/presentation/logic/cubit/current_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/pages/home_page.dart';

class Routes {
  static const String splash = '';
  static const String logIn = '/login';
  static const String signUp = '/login/signup';
  static const String homePage = '/home';
  static const String detailsPage = '/home/detailsPage';
  static const String searchPage = '/home/searchPage';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splash:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());
      // case Routes.logIn:
      //   return MaterialPageRoute(builder: (_) => const LogInPage());
      // case Routes.signUp:
      //   return MaterialPageRoute(builder: (_) => const SignUpPage());
      case Routes.homePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CurrentWeatherCubit(CurrentWeatherRepo(CurrentWeatherService())),
                  child: const HomePage(),
                ));

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Undefined Route'),
        ),
      ),
    );
  }
}
