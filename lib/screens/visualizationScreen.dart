import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VisualizationScreen extends StatelessWidget {
  const VisualizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Visualization Screen"),
          ],
        ),
      ),
    );
  }
}
