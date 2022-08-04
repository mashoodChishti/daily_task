import 'package:daily_task/page/todayTask/today_screen.dart';
import 'package:daily_task/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodayTaskPage extends StatefulWidget {
  final bool? isGridView;
  const TodayTaskPage({Key? key, this.isGridView = false}) : super(key: key);

  @override
  State<TodayTaskPage> createState() => _TodayTaskPageState();
}

PageController controllerListView = PageController(viewportFraction: 1 / 5);

class _TodayTaskPageState extends State<TodayTaskPage> {
  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = Provider.of<ThemeProvider>(context).themeMode;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor:
                (themeMode == ThemeMode.dark) ? Colors.white : Colors.black,
            tabs: const [
              Tab(
                text: "Today",
              ),
              Tab(
                text: "Tomorrow",
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: themeMode == ThemeMode.dark
                  ? Colors.white
                  : const Color(0xff2D35A2),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Today Task",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: themeMode == ThemeMode.dark
                    ? Colors.white
                    : const Color(0xff2D35A2),
                fontFamily: 'Nunito',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.w600,
                height: 1),
          ),
          actions: [
            TextButton(
              child: SizedBox(
                width: 32,
                height: 32,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          color: themeMode == ThemeMode.dark
                              ? Colors.white
                              : const Color(0xff2D35A2),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 11,
                      left: 11,
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: (themeMode == ThemeMode.dark)
                              ? const Color.fromRGBO(45, 53, 162, 1)
                              : Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 17,
                      left: 11,
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: (themeMode == ThemeMode.dark)
                              ? const Color.fromRGBO(45, 53, 162, 1)
                              : Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 11,
                      left: 17,
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: (themeMode == ThemeMode.dark)
                              ? const Color.fromRGBO(45, 53, 162, 1)
                              : Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 17,
                      left: 17,
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: (themeMode == ThemeMode.dark)
                              ? const Color.fromRGBO(45, 53, 162, 1)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(_createRoute(TodayTaskPage(
                  isGridView: !(widget.isGridView!),
                )));
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            TodayScreen(isGridView: widget.isGridView),
            Container(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) =>
        destination,
    transitionDuration: const Duration(milliseconds: 2500),
    reverseTransitionDuration: const Duration(milliseconds: 2500),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCirc,
            reverseCurve: Curves.easeOutCirc.flipped),
        child: child,
      );
    },
  );
}

class CustomRectTween extends MaterialRectCenterArcTween {
  CustomRectTween({required this.a, required this.b}) : super(begin: a, end: b);
  final Rect a, b;

  @override
  Rect lerp(double t) {
    final double myCurve = Curves.easeOutCirc.transform(t);

    return Rect.fromLTRB(
      lerpDouble(a.left, b.left, myCurve),
      lerpDouble(a.top, b.top, myCurve),
      lerpDouble(a.right, b.right, myCurve),
      lerpDouble(a.bottom, b.bottom, myCurve),
    );
  }

  double lerpDouble(num a, num b, double t) {
    return a + (b - a) * t;
  }
}
