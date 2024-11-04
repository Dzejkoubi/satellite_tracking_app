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
        AutoRoute(page: WelcomeRoute.page, initial: true),
        AutoRoute(page: IdRoute.page),
        AutoRoute(page: LocationListRoute.page),
        AutoRoute(page: VisualizationRoute.page),
      ];
}

//For update run: flutter pub run build_runner build
