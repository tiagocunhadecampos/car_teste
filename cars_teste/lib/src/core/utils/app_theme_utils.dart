import 'package:cars_teste/src/config/imports.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: lightPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: lightPrimaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: lightPrimaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightPrimaryColor,
        foregroundColor: whiteColor,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: lightPrimaryColor,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: lightTextColor, fontSize: 16),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: darkPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: darkPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: darkPrimaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkPrimaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkPrimaryColor,
        foregroundColor: whiteColor,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: darkPrimaryColor,
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodyMedium: const TextStyle(color: darkTextColor, fontSize: 16),
        ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(),
      filled: true,
      fillColor: grayColor,
    ),
  );
}
