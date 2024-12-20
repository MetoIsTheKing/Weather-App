import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:weather_app/core/app_colors.dart';

final advancedDrawerController = AdvancedDrawerController();

class AdvancedDrawerExample extends StatelessWidget {
  AdvancedDrawerExample({super.key, required this.child});


  String location =
      "Your Location"; 
 // Replace with your dynamic location variable
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      drawer: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.appBlue,
              AppColors.appLightBlue,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const ListTile(
                    leading: null,
                    title: Text("Current Location"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text(location),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 2,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.add_location_alt),
                    title: Text('Add Location'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Berlin, Germany'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Liverpool, UK'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Washington, USA'),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text('Share this app'),
                  ),
                  ListTile(
                    leading: Icon(Icons.stars),
                    title: Text('Rate this app'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      child: child,
    );
  }
}
