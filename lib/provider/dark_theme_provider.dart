import 'package:flutter/material.dart';
import 'dark_theme_shared_preferance.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreferance darkThemePreference = DarkThemePreferance();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
