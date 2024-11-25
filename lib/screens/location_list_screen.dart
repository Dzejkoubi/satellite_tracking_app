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
  const LocationListScreen({
    required this.isVisible,
    required this.sateliteId,
    super.key,
  });

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
  int numberOfSatelites = 10;

  @override
  void initState() {
    super.initState();
    fetchData(widget.sateliteId, numberOfSatelites, widget.isVisible);
  }

  Future<void> fetchData(satelliteId, int limit, bool isVisible) async {
    try {
      final data = await ApiConfiguration.fetchSatellitePasses(
          sateliteId: satelliteId,
          lat: 50.006462,
          lon: 14.486095,
          limit: limit,
          visibleOnly: isVisible);
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

  // Load more data and preventing multiple clicks
  bool isButtonEnabled = true;

  void loadMore() {
    if (isButtonEnabled == false) return;

    setState(() {
      isButtonEnabled = false;
      isLoading = true;
      numberOfSatelites += 10;
    });

    fetchData(widget.sateliteId, numberOfSatelites, widget.isVisible).then((_) {
      setState(() {
        isButtonEnabled = true;
      });
      // Future.delayed(const Duration(seconds: 2), () {
      //   setState(() {
      //     isButtonEnabled = true;
      //   });
      // });
      // Tohle tady má být ale můj flutter z nějakého důvodu nepodporuje "Duration". Ano zkoušel jsem to i s importem "dart:async" nebo "dart:core" ale nepomohlo to. Taky jsem zkoušel flutter clear a flutter pub dev aby se to resetovalo ale nepomohlo to. Taky jsem zkoušel restartovat počítač ale nepomohlo to. Budu rád když se na to kouknete forknete mi tam jak by to mohlo vypadat aby to fungovalo nebo co bych měl ještě zkusit (Flutter se mi přeinstalovávat nechce protože by to bylo zas na půl dne)
    });
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
                        setState(() {
                          isLoading = true;
                          numberOfSatelites += 10;
                        });
                        fetchData(widget.sateliteId, numberOfSatelites,
                            widget.isVisible);
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
