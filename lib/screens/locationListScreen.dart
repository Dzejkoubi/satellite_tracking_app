import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hodina_6/widgets/locationWidget.dart';

@RoutePage()
class LocationListScreen extends StatelessWidget {
  const LocationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location List Screen"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LocationWidget(rise: "2024-11-04 21:48:53.666379+00:00"),
              LocationWidget(rise: "2024-11-04 21:45:57.172064+00:00"),
              LocationWidget(rise: "2024-11-04 23:22:01.643714+00:00"),
            ],
          ),
        ),
      ),
    );
  }
}
