import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hodina_6/Routes/router.dart';
import 'package:hodina_6/shared/spaceBoxes.dart';
import 'package:hodina_6/shared/styledButton.dart';

@RoutePage()
class IdScreen extends StatefulWidget {
  const IdScreen({super.key});

  @override
  State<IdScreen> createState() => _IdScreenState();
}

class _IdScreenState extends State<IdScreen> {
  bool visible = true;

  void visibleSwitch(bool value) {
    setState(() {
      visible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text("Enter the ID of the satelite"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CupertinoTextField(
                placeholder: 'Enter the ID',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Show visible"),
                  const VerticalSpace(width: 10),
                  Switch(
                      value: visible,
                      onChanged: (value) {
                        visibleSwitch(value);
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StyledCupertinoTextButton(
                      onPressed: () {
                        AutoRouter.of(context).push(const LocationListRoute());
                      },
                      child: const Text("Show Locations")),
                ],
              ),
              const HorizontalSpace(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
