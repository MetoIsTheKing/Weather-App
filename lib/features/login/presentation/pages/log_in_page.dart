import 'package:flutter/material.dart';
import 'package:weather_app/config/app_routes.dart';
import 'package:weather_app/features/login/presentation/widgets/my_button.dart';
import 'package:weather_app/features/login/presentation/widgets/my_gradient_text.dart';

import '../widgets/my_text_field.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40,),
              const MyGradientText(
                  fontSize: 30,
                  text: 'Log in',
                  colors: [
                    Color(0XFF0C386C),
                    Color(0XFF294F97),
                  ]
              ),
              const SizedBox(height: 30),
              const MyTextField(text: 'Email',),
              const SizedBox(height: 20),
              const MyTextField(text: 'Password',),
              const SizedBox(height: 30),
              MyButton(
                onPressed: () {  },
                text: 'Log In',
              ),
              const SizedBox(height: 200),
              const Center(
                child: MyGradientText(
                    fontSize: 14,
                    text: 'If you don\'t have an account \n        please sign up here',
                    colors: [
                      Color(0XFF0C386C),
                      Color(0XFF294F97),
                    ]
                ),
              ),
              const SizedBox(height: 20,),
              MyButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.signUp,);
                },
                text: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}