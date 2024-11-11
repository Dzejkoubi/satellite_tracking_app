import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:hodina_6/api/satellite_data.dart';
import 'package:hodina_6/shared/styled_button.dart';
import 'package:hodina_6/widgets/location_widget.dart';
import 'package:hodina_6/shared/styled_text.dart';

@RoutePage()
class LocationListScreen extends StatefulWidget {
  const LocationListScreen({required this.data, super.key});

  final SatelliteData? data;

  @override
  State<LocationListScreen> createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: NormalTextStyledCupertino(text: "Location list"),
        ),
        child: ListView(
          children: [
            ButtonStyledCupertino(
              child: const NormalTextStyledCupertino(text: "Print data"),
              onPressed: () async {
                print(widget.data.toString());
              },
            ),
          ],
        ));
  }
}
