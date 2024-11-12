import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hodina_6/Routes/router.dart';
import 'package:hodina_6/api/satellite_data.dart';
import 'package:hodina_6/shared/styled_text.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget(
      {required this.data, required this.rise, required this.index, super.key});

  final SatelliteData? data;
  final String rise;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.router.push(InformationRoute(data: data!.passes[index])),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NormalTextStyledCupertino(text: rise),
            IconButton(
                onPressed: () async {
                  await context.router
                      .push(InformationRoute(data: data!.passes[index]));
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded)),
          ],
        ),
      ),
    );
  }
}
