import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferance {
  static const themeStatus = 'theme_status';

  setDarkTheme(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(themeStatus, value);
  }

  Future<bool> getDarkTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(themeStatus) ?? false;
  }
}
