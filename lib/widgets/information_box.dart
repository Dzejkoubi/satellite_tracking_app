import 'package:flutter/cupertino.dart';
import 'package:hodina_6/shared/space_boxes.dart';
import 'package:hodina_6/shared/styled_text.dart';
import 'package:cupertino_container/cupertino_container.dart';

class InformationBox extends StatelessWidget {
  const InformationBox(this.visible,
      {required this.position,
      required this.altitute,
      required this.azimuth,
      required this.azimuthOctant,
      required this.utcDateTime,
      required this.isSunlit,
      super.key});

  final String position;
  final double altitute;
  final double azimuth;
  final String azimuthOctant;
  final String utcDateTime;
  final bool isSunlit;

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return CupertinoContainer(
      radius: BorderRadius.circular(20),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          const CupertinoDynamicColor.withBrightness(
            color: CupertinoColors.lightBackgroundGray,
            darkColor: CupertinoColors.darkBackgroundGray,
          ),
          context,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child:
                    ImportantTextStyledCupertino(text: position.toUpperCase()),
              ),
              const Positioned(right: 0, child: Icon(CupertinoIcons.info)),
            ],
          ),
          const HorizontalSpace(height: 10),
          ...[
            NormalTextStyledCupertino(text: "Altitude: $altitute"),
            NormalTextStyledCupertino(
                text: "Azimuth: $azimuth° $azimuthOctant"),
            NormalTextStyledCupertino(text: "UTC: $utcDateTime"),
            Text(
              isSunlit ? "Sunlit" : "Not sunlit",
              style: TextStyle(
                color: isSunlit
                    ? CupertinoColors.systemGreen
                    : CupertinoColors.systemRed,
              ),
            ),
          ]
              .expand((widget) => [widget, const HorizontalSpace(height: 10)])
              .take(7),
        ],
      ),
    );
  }
}
