// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [IdScreen]
class IdRoute extends PageRouteInfo<void> {
  const IdRoute({List<PageRouteInfo>? children})
      : super(
          IdRoute.name,
          initialChildren: children,
        );

  static const String name = 'IdRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IdScreen();
    },
  );
}

/// generated route for
/// [InformationScreen]
class InformationRoute extends PageRouteInfo<InformationRouteArgs> {
  InformationRoute({
    required SatellitePass data,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          InformationRoute.name,
          args: InformationRouteArgs(
            data: data,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InformationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InformationRouteArgs>();
      return InformationScreen(
        data: args.data,
        key: args.key,
      );
    },
  );
}

class InformationRouteArgs {
  const InformationRouteArgs({
    required this.data,
    this.key,
  });

  final SatellitePass data;

  final Key? key;

  @override
  String toString() {
    return 'InformationRouteArgs{data: $data, key: $key}';
  }
}

/// generated route for
/// [LocationListScreen]
class LocationListRoute extends PageRouteInfo<LocationListRouteArgs> {
  LocationListRoute({
    required SatelliteData? data,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LocationListRoute.name,
          args: LocationListRouteArgs(
            data: data,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LocationListRouteArgs>();
      return LocationListScreen(
        data: args.data,
        key: args.key,
      );
    },
  );
}

class LocationListRouteArgs {
  const LocationListRouteArgs({
    required this.data,
    this.key,
  });

  final SatelliteData? data;

  final Key? key;

  @override
  String toString() {
    return 'LocationListRouteArgs{data: $data, key: $key}';
  }
}

/// generated route for
/// [VisualizationScreen]
class VisualizationRoute extends PageRouteInfo<void> {
  const VisualizationRoute({List<PageRouteInfo>? children})
      : super(
          VisualizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'VisualizationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VisualizationScreen();
    },
  );
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomeScreen();
    },
  );
}
