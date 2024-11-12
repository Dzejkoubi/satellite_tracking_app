import 'package:auto_route/auto_route.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hodina_6/Routes/router.dart';
import 'package:hodina_6/api/satellite_data.dart';
import 'package:hodina_6/shared/space_boxes.dart';
import 'package:hodina_6/shared/styled_button.dart';
import 'package:hodina_6/shared/styled_text.dart';
import 'package:hodina_6/widgets/information_box.dart';

@RoutePage()
class InformationScreen extends StatefulWidget {
  const InformationScreen({required this.data, super.key});

  final SatellitePass data;

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    final events = [
      {
        "position": "rise",
        "event": widget.data.rise,
      },
      {
        "position": "culmination",
        "event": widget.data.culmination,
      },
      {
        "position": "set",
        "event": widget.data.set,
      },
    ];

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: NormalTextStyledCupertino(text: "Information"),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const HorizontalSpace(
                height: 10,
              ),
              ListView(
                shrinkWrap: true,
                children: events.map((event) {
                  final eventData =
                      event["event"] as Event; // Cast to Event type

                  return InformationBox(
                    widget.data.isVisible,
                    position: event["position"] as String,
                    altitute: eventData.altitute,
                    azimuth: eventData.azimuth,
                    azimuthOctant: eventData.azimuthOctant,
                    utcDateTime: eventData.utcDateTime,
                    isSunlit: widget.data.isVisible,
                  );
                }).toList(),
              ),
              ButtonStyledCupertino(
                  onPressed: () =>
                      context.router.push(const VisualizationRoute()),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImportantTextStyledCupertino(
                          text: "SHOW 3D VISUALIZATION"),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  )),
            ],
          )),
        ),
      ),
    );
  }
}
