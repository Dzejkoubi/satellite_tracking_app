import 'package:auto_route/auto_route.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hodina_6/Routes/router.dart';
import 'package:hodina_6/shared/space_boxes.dart';
import 'package:hodina_6/shared/styled_button.dart';
import 'package:hodina_6/shared/styled_text.dart';
import 'package:hodina_6/widgets/information_box.dart';

@RoutePage()
class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: NormalTextStyledCupertino(text: "Information"),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const HorizontalSpace(
                height: 10,
              ),
              const InformationBox(
                true,
                position: "rise",
                altitute: 90.0,
                azimuth: 45.0,
                azimuthOctant: "S",
                utcDateTime: "2022-30-10 23:38:12",
                isSunlit: true,
              ),
              const InformationBox(
                false,
                position: "culmination",
                altitute: 90.0,
                azimuth: 45.0,
                azimuthOctant: "S",
                utcDateTime: "2022-30-10 23:38:12",
                isSunlit: false,
              ),
              const InformationBox(
                true,
                position: "set",
                altitute: 45.0,
                azimuth: 180.0,
                azimuthOctant: "S",
                utcDateTime: "2022-30-10 23:38:36",
                isSunlit: true,
              ),
              ButtonStyledCupertino(
                  onPressed: () => AutoRouter.of(context)
                      .replace(const VisualizationRoute()),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImportantTextStyledCupertino(
                          text: "SHOW 3D VISUALIZATION"),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
