import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:hodina_6/api/satellite_data.dart';
import 'package:hodina_6/shared/styled_text.dart';
import 'package:hodina_6/widgets/location_widget.dart';
import 'package:intl/intl.dart';

@RoutePage()
class LocationListScreen extends StatefulWidget {
  const LocationListScreen({required this.data, super.key});

  final SatelliteData? data;

  @override
  State<LocationListScreen> createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {
  String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);

    String formatedDateTime =
        DateFormat('yyyy. MM. dd – kk:mm').format(DateTime.parse(date));

    return formatedDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: NormalTextStyledCupertino(text: "Location list"),
        ),
        child: ListView(
          children: [
            ListView.builder(
              itemCount: widget.data?.passes.length ?? 0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final pass = widget.data?.passes[index];
                String formatedDateTime =
                    formatDate(pass?.rise.utcDateTime ?? "");
                return LocationWidget(
                  data: widget.data,
                  rise: formatedDateTime,
                  index: index,
                );
              },
            )
          ],
        ));
  }
}
