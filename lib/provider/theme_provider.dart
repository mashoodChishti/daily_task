import 'package:daily_task/provider/own_themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.grey.shade900, opacity: 1),
    hintColor: Colors.grey.shade200,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
  )..addOwn(const OwnThemeFields(textColor: Colors.white));
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xff2D35A2),
      primaryColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      iconTheme: const IconThemeData(
        color: Color(0xff52CCFF),
      ),
      hintColor: Colors.grey.shade400,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.white))
    ..addOwn(const OwnThemeFields(textColor: Color.fromRGBO(45, 53, 162, 1)));
}
