import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hodina_6/Routes/router.dart';
import 'package:hodina_6/shared/styledText.dart';

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
            const LargeTextStyled(
              text: "Welcome to the app",
            ),
            IconButton(
                onPressed: () {
                  AutoRouter.of(context).replace(const IdRoute());
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded)),
          ],
        ),
      ),
    );
  }
}
