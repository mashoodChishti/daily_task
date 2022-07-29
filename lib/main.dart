import 'package:daily_task/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'page/OnBoardingScreens/on_boardings_screen1.dart';
import 'page/home/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences? pref = await SharedPreferences.getInstance();
  bool? showHome = false;
  showHome = pref.containsKey('showHome') ? pref.getBool('showHome') : false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatefulWidget {
  final bool? showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final provider = Provider.of<ThemeProvider>(context);
        return GetMaterialApp(
          title: 'Tasky',
          themeMode: provider.themeMode,
          darkTheme: MyThemes.darkTheme,
          theme: MyThemes.lightTheme,
          debugShowCheckedModeBanner: false,
          home: widget.showHome! ? const HomePage() : const OnBoardingScreen1(),
        );
      });
}
