import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:hodina_6/api/satellite_data.dart';
import 'package:hodina_6/screens/visualization_screen.dart';
import 'package:hodina_6/screens/welcome_screen.dart';
import 'package:hodina_6/screens/id_screen.dart';
import 'package:hodina_6/screens/location_list_screen.dart';
import 'package:hodina_6/screens/information_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page, initial: true),
        AutoRoute(page: IdRoute.page, initial: false),
        AutoRoute(page: LocationListRoute.page, initial: false),
        AutoRoute(page: InformationRoute.page, initial: false),
        AutoRoute(page: VisualizationRoute.page, initial: false)
      ];
}

//For update run: flutter pub run build_runner build
//For watch run: flutter pub run build_runner watch
