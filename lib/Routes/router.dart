import 'package:auto_route/auto_route.dart';
import 'package:hodina_6/screens/welcomeScreen.dart';
import 'package:hodina_6/screens/idScreen.dart';
import 'package:hodina_6/screens/locationListScreen.dart';
import 'package:hodina_6/screens/visualizationScreen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page, initial: false),
        AutoRoute(page: IdRoute.page, initial: false),
        AutoRoute(page: LocationListRoute.page, initial: false),
        AutoRoute(page: VisualizationRoute.page, initial: true),
      ];
}

//For update run: flutter pub run build_runner build
