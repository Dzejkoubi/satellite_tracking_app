import 'package:flutter/cupertino.dart';
import 'package:hodina_6/shared/styled_text.dart';

class InformationBox extends StatelessWidget {
  const InformationBox(
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImportantTextStyledCupertino(text: position.toUpperCase()),
          NormalTextStyledCupertino(text: "Altitude: $altitute"),
        ],
      ),
    );
  }
}
