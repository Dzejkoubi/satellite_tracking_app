import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:hodina_6/api/api_configuration.dart';
import 'package:hodina_6/api/satellite_data.dart';
import 'package:hodina_6/shared/styled_button.dart';
import 'package:hodina_6/shared/styled_text.dart';
import 'package:hodina_6/widgets/location_widget.dart';
import 'package:intl/intl.dart';

@RoutePage()
class LocationListScreen extends StatefulWidget {
  const LocationListScreen(
      {required this.numberOfSatelites,
      required this.isVisible,
      required this.sateliteId,
      super.key});

  final int numberOfSatelites;
  final bool isVisible;
  final int sateliteId;

  @override
  State<LocationListScreen> createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {
  String formatDate(String date) {
    String formatedDateTime =
        DateFormat('dd. MM. yyyy – kk:mm').format(DateTime.parse(date));

    return formatedDateTime;
  }

  SatelliteData? satelliteData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final int sateliteId = widget.sateliteId;
      final data = await ApiConfiguration.fetchSatellitePasses(
          sateliteId: sateliteId,
          lat: 50.006462,
          lon: 14.486095,
          limit: 10,
          visibleOnly: widget.isVisible);
      setState(() {
        satelliteData = data;
        isLoading = false;
      });
    } catch (e) {
      print("Error loading satellite passes: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: NormalTextStyledCupertino(text: "Location list"),
      ),
      child: isLoading
          ? const Center(child: CupertinoActivityIndicator())
          : ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                ListView.builder(
                  itemCount: satelliteData?.passes.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final pass = satelliteData?.passes[index];
                    String formatedDateTime =
                        formatDate(pass?.rise.utcDateTime ?? "");
                    return LocationWidget(
                      data: satelliteData,
                      rise: formatedDateTime,
                      index: index,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: ButtonStyledCupertino(
                      child: const NormalTextStyledCupertino(text: "Load more"),
                      onPressed: () {
                        fetchData();
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
