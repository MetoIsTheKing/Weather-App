import 'package:flutter/material.dart';
import 'package:weather_app/core/app_colors.dart';
import 'package:weather_app/features/login/presentation/widgets/my_gradient_text.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final double? borderRadius;
  final List<Color>? colors;
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final String text;


  const MyTextField({
    super.key,
    this.controller,
    this.borderRadius,
    this.colors,
    this.begin,
    this.end,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyGradientText(
            fontSize: 14,
            text: text,
            colors: colors?? const [
              AppColors.appBlue,
              AppColors.appBlue,
              AppColors.appLightBlue,
            ],
        ),
        SizedBox(height: 8,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius?? 8),
            border: Border.all(
              width: 2,
              color: Colors.transparent,
            ),
            gradient: LinearGradient(
              colors: colors?? const [
                AppColors.appBlue,
                AppColors.appBlue,
                AppColors.appLightBlue,
              ],
              begin: begin?? Alignment.topCenter,
              end: end?? Alignment.bottomCenter,
            ),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius?? 8),
                borderSide: BorderSide.none
              ),
            ),
          ),
        ),
      ],
    );
  }
}
