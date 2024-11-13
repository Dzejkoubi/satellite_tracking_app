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

  // Number of satellites to show
  final List<int> _numOfShowedSatellites = [1, 5, 10, 15, 20, 50];

  final int _selectedNumOfSatellites = 5;

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
                      AutoRouter.of(context).push(LocationListRoute(
                          numberOfSatelites: _selectedNumOfSatellites,
                          isVisible: visible,
                          sateliteId: int.parse(_sateliteIdController.text)));
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
