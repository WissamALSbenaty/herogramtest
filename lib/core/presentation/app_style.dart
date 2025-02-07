import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class   AppStyle {
  static final ThemeData theme = ThemeData(
      primaryColor: lightPrimaryColor,
      textTheme: textTheme,
      scaffoldBackgroundColor: white,
      colorScheme: const ColorScheme.light(
          primary: AppStyle.lightPrimaryColor, secondary: Colors.red),
      indicatorColor: lightPrimaryColor,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      )),
      cardTheme: const CardTheme(color: white, surfaceTintColor: Colors.transparent));
  static final TextTheme textTheme = TextTheme(
    headlineMedium: TextStyle(
      fontSize: 36.spMin,
      //height: getIt<LocalizationController>().isRtlLanguage ? 1.3 : null,
      color: black,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontSize: 32.spMin,
      //height: getIt<LocalizationController>().isRtlLanguage ? 1.3 : null,
      color: black,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 28.spMin,
      //height: getIt<LocalizationController>().isRtlLanguage ? 1.3 : null,
      color: black,
    ),
    titleMedium: TextStyle(
      fontSize: 24.spMin,
      //height: getIt<LocalizationController>().isRtlLanguage ? 1.3 : null,
      color: black,
    ),
    titleSmall: TextStyle(
      fontSize: 20.spMin,
      //height: getIt<LocalizationController>().isRtlLanguage ? 1.3 : null,
      color: black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.spMin,
      //height: getIt<LocalizationController>().isRtlLanguage ? 1.3 : null,
      color: black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.spMin,
      //height: getIt<LocalizationController>().isRtlLanguage ? 1.3 : null,
      color: black,
    ),
    bodySmall: TextStyle(
      fontSize: 12.spMin,
      //height: getIt<LocalizationController>().isRtlLanguage ? 1.3 : null,
      color: black,
    ),
    labelSmall: TextStyle(
      fontSize: 10.spMin,
      //height: getIt<LocalizationController>().isRtlLanguage ? 1.3 : null,
      color: black,
    ),
  );

  static List<BoxShadow> boxShadow = [
    BoxShadow(
        offset: const Offset(0, 2),
        color: AppStyle.black.shade200,
        blurRadius: 1.r)
  ];

  static const Color white = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFE30000);
  static const Color warringColor = Color(0xFFFFEB3B);
  static const Color starsColor = Color(0xFFF5C107);
  static const Color lightPrimaryColor = Color(0xFFDF7E8E);
  static const Color darkPrimaryColor = Color(0xFFBC6470);
  static const Color confirmationColor = Color(0xFF10C84F);
  static const Color lightPink = Color(0xFFFFE5EF);
  static const Color lightGray = Color(0xFFF2F1F1);

  static const LinearGradient gradient = LinearGradient(
    colors: [lightPrimaryColor, Color(0xFFAF4F64)],
  );
  static const BorderRadius borderRadius = BorderRadius.all(Radius.circular(8));
  static const MaterialColor black = MaterialColor(0xFF1A0700, {
    100: Color(0xFFEFF5FA),
    200: Color(0xFFE5E5E5),
    300: Color(0xFFC9CDD5),
    400: Color(0xFF949BAB),
    500: Color(0xFF8E989E),
    600: Color(0xFF73858F),
    700: Color(0xFF53555F),
    800: Color(0xFF1A0700),
    900: Color(0xFF000000),
  });
}
