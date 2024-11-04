import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:hodina_6/Routes/router.dart';

void main() {
  runApp(const MainApp());
}

@routePage
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return CupertinoApp.router(
      debugShowCheckedModeBanner: false,
      title: "Navigation",
      routerConfig: appRouter.config(),
    );
  }
}
