import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextEditingController _sateliteIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _sateliteIdController.dispose();
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
      final int sateliteId = int.parse(_sateliteIdController.text);
      final data = await ApiConfiguration.fetchSatellitePasses(
          sateliteId: sateliteId,
          lat: 50.006462,
          lon: 14.486095,
          limit: 10,
          visibleOnly: visible);
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

  final double _kItemExtent = 32.0;
  final List<int> _numOfShowedSatellites = <int>[1, 5, 10, 20, 50, 100];

  int _selectedNumOfSatellites = 0;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
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
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5)
                  ],
                  controller: _sateliteIdController..text = "25544",
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  placeholder: 'Enter the ID of a satellite',
                  suffix: IconButton(
                    iconSize: 20,
                    icon: const Icon(CupertinoIcons.clear),
                    onPressed: () {
                      _sateliteIdController.clear();
                    },
                  ),
                ),
                const HorizontalSpace(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonStyledCupertino(
                      child: const Text("Show:"),
                      onPressed: () => _showDialog(
                        CupertinoPicker(
                          magnification: 1.22,
                          squeeze: 1.2,
                          useMagnifier: true,
                          itemExtent: _kItemExtent,
                          // This sets the initial item.
                          scrollController: FixedExtentScrollController(
                            initialItem: _selectedNumOfSatellites,
                          ),
                          // This is called when selected item is changed.
                          onSelectedItemChanged: (int selectedItem) {
                            setState(() {
                              _selectedNumOfSatellites = selectedItem;
                            });
                          },
                          children: List<Widget>.generate(
                              _numOfShowedSatellites.length, (int index) {
                            return Center(
                                child: Text(
                                    _numOfShowedSatellites[index].toString()));
                          }),
                        ),
                      ),
                    ),
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
                  ],
                ),
                const HorizontalSpace(height: 50),
                ButtonStyledCupertino(
                    onPressed: () async {
                      await fetchData();
                      AutoRouter.of(context)
                          .push(LocationListRoute(data: satelliteData));
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
