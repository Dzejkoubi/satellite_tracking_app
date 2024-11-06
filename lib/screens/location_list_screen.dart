import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:hodina_6/widgets/location_widget.dart';
import 'package:hodina_6/shared/styled_text.dart';

@RoutePage()
class LocationListScreen extends StatelessWidget {
  const LocationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: NormalTextStyledCupertino(text: "Satelites"),
      ),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return LocationWidget(rise: "20.9.2024 20:19:3$index");
        },
      ),
    );
  }
}
