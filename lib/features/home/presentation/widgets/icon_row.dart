import 'package:flutter/material.dart';
import 'package:weather_app/core/app_colors.dart';

class IconRow extends StatelessWidget {
  final String icon;
  final String value;
  const IconRow({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: -3,
          runSpacing: 0,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            IconButton(
              onPressed: null,
              icon: Image.asset(icon),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.appWhite,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
