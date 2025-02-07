import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herogram/core/presentation/app_style.dart';
import 'package:herogram/core/presentation/router/auto_router.dart';
import 'package:herogram/core/presentation/snake_bars/bottom_snack_bar.dart';
import 'package:toastification/toastification.dart';

import 'dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp( ScreenUtilInit(
      designSize: const Size(375, 812),
  splitScreenMode: true,
  minTextAdapt: true,
  child: MyApp(
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return   ToastificationWrapper(
      config: const ToastificationConfig(
          alignment:Alignment.bottomCenter ),
      child:MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: getAppRouter.config(),
        scaffoldMessengerKey: getIt<SnakeBarShower>().snakeBarKey,

      theme: AppStyle.theme,

      builder:
          (final context, final child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
              viewPadding: EdgeInsets.zero,
              textScaler: TextScaler.noScaling
          ),
          child: Observer(builder: (final context) {
            return child!;
          })),
      // home: const SplashPage(),
    ));
  }
}
