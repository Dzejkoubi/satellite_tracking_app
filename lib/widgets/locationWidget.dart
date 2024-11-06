import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hodina_6/Routes/router.dart';
import 'package:hodina_6/shared/styledText.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({required this.rise, super.key});

  final String rise;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(VisualizationRoute()),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NormalTextStyledCupertino(text: rise),
            IconButton(
                onPressed: () {
                  context.router.push(VisualizationRoute());
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded)),
          ],
        ),
      ),
    );
  }
}
