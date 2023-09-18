import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  bool _isDark = false;
  bool get isDark=>_isDark;

  void toggleTheme(){
    _isDark=!isDark;
    notifyListeners();
  }

  ThemeData get themeData => _isDark?
  ThemeData(
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.black,elevation: 0),
    appBarTheme: const AppBarTheme(elevation: 0,backgroundColor: Colors.black,foregroundColor: Colors.white),
    brightness: Brightness.dark, colorScheme: const ColorScheme.dark(primary: Colors.red,secondary: Colors.red)):
  ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.white,elevation: 0),
    appBarTheme: const AppBarTheme(elevation: 0,backgroundColor: Colors.white,foregroundColor: Colors.black),
    brightness: Brightness.light, colorScheme: const ColorScheme.light(primary: Colors.red,secondary: Colors.red));
}
