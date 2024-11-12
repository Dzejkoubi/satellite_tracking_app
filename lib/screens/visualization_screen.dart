import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hodina_6/shared/styled_text.dart';

@RoutePage()
class VisualizationScreen extends StatelessWidget {
  const VisualizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: NormalTextStyledCupertino(text: "Satelites"),
        ),
        child: Container());
  }
}
