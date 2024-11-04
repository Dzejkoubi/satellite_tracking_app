import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:hodina_6/Routes/router.dart';
import 'package:hodina_6/shared/spaceBoxes.dart';
import 'package:hodina_6/shared/styledButton.dart';
import 'package:hodina_6/shared/styledText.dart';

@RoutePage()
class IdScreen extends StatefulWidget {
  const IdScreen({super.key});

  @override
  State<IdScreen> createState() => _IdScreenState();
}

class _IdScreenState extends State<IdScreen> {
  bool visible = true;

  void _toggleVisibility(bool newValue) {
    setState(() {
      visible = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Satelite ID"),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CupertinoTextField(
                  placeholder: 'Enter the ID',
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
                TextButtonStyledCupertino(
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
