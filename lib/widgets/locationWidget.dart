import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hodina_6/Routes/router.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({required this.rise, super.key});

  final String rise;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(rise),
            IconButton(
                onPressed: () {
                  AutoRouter.of(context).push(const VisualizationRoute());
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded)),
          ],
        ),
      ),
    );
  }
}
