// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [MetricDetailsPage]
class MetricDetailsRoute extends PageRouteInfo<MetricDetailsRouteArgs> {
  MetricDetailsRoute({
    Key? key,
    required MetricDetailsPageArguments args,
    List<PageRouteInfo>? children,
  }) : super(
          MetricDetailsRoute.name,
          args: MetricDetailsRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'MetricDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MetricDetailsRouteArgs>();
      return MetricDetailsPage(
        key: args.key,
        args: args.args,
      );
    },
  );
}

class MetricDetailsRouteArgs {
  const MetricDetailsRouteArgs({
    this.key,
    required this.args,
  });

  final Key? key;

  final MetricDetailsPageArguments args;

  @override
  String toString() {
    return 'MetricDetailsRouteArgs{key: $key, args: $args}';
  }
}
