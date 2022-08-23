import 'package:daily_task/page/OnBoardingScreens/on_boardings_screen1.dart';
import 'package:daily_task/provider/auth_provider.dart';
import 'package:daily_task/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart';
import 'page/login/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences? pref = await SharedPreferences.getInstance();
  bool? showHome = false;
  showHome = pref.containsKey('showHome') ? pref.getBool('showHome') : false;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: Builder(
        builder: (context) {
          final provider = Provider.of<ThemeProvider>(context);
          return GetMaterialApp(
            title: 'Tasky',
            themeMode: provider.themeMode,
            darkTheme: MyThemes.darkTheme,
            theme: MyThemes.lightTheme,
            debugShowCheckedModeBanner: false,
            home: widget.showHome!
                ? const LoginScreen()
                : const OnBoardingScreen1(),
          );
        },
      ),
    );
  }
}
