import 'package:auto_route/auto_route.dart';

import 'package:flutter/cupertino.dart';
import 'package:hodina_6/shared/spaceBoxes.dart';
import 'package:hodina_6/shared/styledText.dart';
import 'package:hodina_6/widgets/informationBox.dart';
import '';

@RoutePage()
class VisualizationScreen extends StatelessWidget {
  const VisualizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: NormalTextStyledCupertino(text: "Information"),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              HorizontalSpace(
                height: 5,
              ),
              InformationBox(
                position: "Rise",
                altitute: 90.0,
                azimuth: 45.0,
                azimuthOctant: "S",
                utcDateTime: "2022-30-10 23:38:12",
                isSunlit: true,
              ),
              InformationBox(
                position: "Set",
                altitute: 45.0,
                azimuth: 180.0,
                azimuthOctant: "S",
                utcDateTime: "2022-30-10 23:38:36",
                isSunlit: true,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
