import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferance {
  static const THEME_STATUS = 'theme_status';

  setDarkTheme(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(THEME_STATUS, value);
  }

  Future<bool> getDarkTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(THEME_STATUS) ?? false;
  }
}