import 'package:flutter/material.dart';
import 'package:weather_app/features/login/presentation/widgets/my_text_field.dart';
import 'package:weather_app/features/login/presentation/widgets/my_gradient_text.dart';
import '../widgets/my_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                  text: 'Sign Up',
                  colors: [
                    Color(0XFF0C386C),
                    Color(0XFF294F97),
                  ]
              ),
              const SizedBox(height: 30),
              const MyTextField(text: 'Email',),
              const SizedBox(height: 20),
              const MyTextField(text: 'Password',),
              const SizedBox(height: 20),
              const MyTextField(text: 'Confirm Password'),
              const SizedBox(height: 20),
              const MyTextField(text: 'Your Location'),
              const SizedBox(height: 120,),
              MyButton(
                onPressed: () {  },
                text: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
