import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final String altitute;
  final String azimuth;
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
              Positioned(
                right: 0,
                child: GestureDetector(
                  child: const Icon(CupertinoIcons.info),
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoActionSheet(
                          title: ImportantTextStyledCupertino(
                              text: position.toUpperCase()),
                          message: Text(position == "rise"
                              ? "This is when the satelite first shows up in the sky."
                              : position == "culmination"
                                  ? "This is when the satelite is at its highest point in the sky."
                                  : position == "set"
                                      ? "This is when the satelite disappears from the sky."
                                      : "Unknown position"),
                          actions: <CupertinoActionSheetAction>[
                            CupertinoActionSheetAction(
                              child: const Text('Close'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                    // showCupertinoDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return CupertinoAlertDialog(
                    //       title: ImportantTextStyledCupertino(
                    //           text: position.toUpperCase()),
                    //       content: Text(position == "rise"
                    //           ? "This is when the satelite first shows up in the sky"
                    //           : position == "culmination"
                    //               ? "This is when the satelite is at its highest point in the sky"
                    //               : position == "set"
                    //                   ? "This is when the satelite disappears from the sky"
                    //                   : "Unknown position"),
                    //       actions: [
                    //         CupertinoDialogAction(
                    //           child: const Text("OK"),
                    //           onPressed: () {
                    //             Navigator.of(context).pop();
                    //           },
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // );
                  },
                ),
              ),
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
