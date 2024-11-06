import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:hodina_6/Routes/router.dart';
import 'package:hodina_6/shared/styled_button.dart';
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
            IconButtonStyledCupertino(
              40,
              icon: CupertinoIcons.arrow_right_circle_fill,
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
