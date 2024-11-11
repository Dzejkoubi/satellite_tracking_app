import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hodina_6/Routes/router.dart';
import 'package:hodina_6/api/api_configuration.dart';
import 'package:hodina_6/api/satellite_data.dart';
import 'package:hodina_6/shared/space_boxes.dart';
import 'package:hodina_6/shared/styled_button.dart';
import 'package:hodina_6/shared/styled_text.dart';

@RoutePage()
class IdScreen extends StatefulWidget {
  const IdScreen({super.key});

  @override
  State<IdScreen> createState() => _IdScreenState();
}

class _IdScreenState extends State<IdScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool visible = true; // Initial visibility of the satellite

  void _toggleVisibility(bool newValue) {
    // Toggle visibility of the satelite
    setState(() {
      visible = newValue;
      print(newValue);
    });
  }

  SatelliteData? satelliteData;
  bool isLoading = true;

  Future<void> fetchData() async {
    try {
      final data = await ApiConfiguration.fetchSatellitePasses(
          sateliteId: 25544, lat: 50.006462, lon: 14.486095, limit: 10);
      setState(() {
        satelliteData = data;
        isLoading = false;
      });
      print(data);
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
        middle: NormalTextStyledCupertino(text: "Find a satellite using an ID"),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoTextField(
                  controller: _controller,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  placeholder: 'Enter the ID of a satellite',
                  suffix: IconButton(
                    iconSize: 20,
                    icon: const Icon(CupertinoIcons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  ),
                ),
                const HorizontalSpace(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const NormalTextStyledCupertino(
                    text: "Visible",
                  ),
                  const VerticalSpace(width: 10),
                  ToggleButtonStyledCupertino(
                    value: visible,
                    onToggle: _toggleVisibility,
                  ),
                ]),
                const HorizontalSpace(height: 50),
                ButtonStyledCupertino(
                    onPressed: () {
                      AutoRouter.of(context).push(const LocationListRoute());
                    },
                    child: const NormalTextStyledCupertino(
                        text: "Show Locations")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
