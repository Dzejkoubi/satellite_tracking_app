import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hodina_6/Routes/router.dart';
import 'package:hodina_6/shared/styled_text.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LargeTextStyledCupertino(
              text: "Welcome to the app",
            ),
            IconButton(
              iconSize: 40,
              icon: const Icon(CupertinoIcons.arrow_right_circle_fill),
              onPressed: () {
                AutoRouter.of(context).replace(const IdRoute());
              },
            )
          ],
        ),
      ),
    );
  }
}
