import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:herogram/core/presentation/arguments/metric_details_page_arguments.dart';
import 'package:herogram/dependencies.dart';
import 'package:herogram/features/home/presentation/pages/home_page.dart';
import 'package:herogram/features/home/presentation/pages/metric_details_page.dart';
import 'package:injectable/injectable.dart';

part 'auto_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true,),
        AutoRoute(page: MetricDetailsRoute.page),
      ];
}

@module
abstract class AppRouterModule {
  @singleton
  AppRouter get getAppRouter => AppRouter();
}

AppRouter getAppRouter =getIt<AppRouter>();
