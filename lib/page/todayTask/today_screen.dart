import 'package:daily_task/provider/theme_provider.dart';
import 'package:daily_task/widgets/todayTaskWidgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodayScreen extends StatelessWidget {
  final bool? isGridView;
  TodayScreen({Key? key, required this.isGridView}) : super(key: key);

  final data = [
    {
      "mainText": "Mobile app prototype",
      "bottomText": "Make mobile app\nuntil prototype"
    },
    {
      "mainText": "Medical Dashboard",
      "bottomText": "Make medical\nwith source file"
    },
    {
      "mainText": "Landing page with responsive",
      "bottomText": "Landing page size macbook\nand responsive"
    },
    {
      "mainText": "Mobile app prototype",
      "bottomText": "Make mobile app\nuntil prototype"
    }
  ];

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = Provider.of<ThemeProvider>(context).themeMode;
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              isGridView!
                  ? Hero(
                      tag: "isGridView",
                      createRectTween: (Rect? begin, Rect? end) {
                        return CustomRectTween(a: begin!, b: end!);
                      },
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return TaskTile(
                              tileColor: (i == 0)
                                  ? (themeMode == ThemeMode.dark)
                                      ? Colors.grey.shade900
                                      : const Color.fromRGBO(45, 53, 162, 1)
                                  : (themeMode == ThemeMode.dark)
                                      ? Colors.grey.shade800
                                      : Colors.white,
                              titleColor: (i == 0)
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : (themeMode == ThemeMode.dark)
                                      ? const Color.fromRGBO(255, 255, 255, 1)
                                      : const Color.fromRGBO(32, 48, 79, 1),
                              descriptionColor: (i == 0)
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : const Color.fromRGBO(183, 183, 183, 1),
                              taskTitle: data[i]['mainText']!,
                              taskDescription: data[i]['bottomText']!);
                        },
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                crossAxisCount: 2),
                      ),
                    )
                  : Hero(
                      tag: "isListView",
                      createRectTween: (Rect? begin, Rect? end) {
                        return CustomRectTween(a: begin!, b: end!);
                      },
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return TaskTile(
                              tileColor: (i == 0)
                                  ? (themeMode == ThemeMode.dark)
                                      ? Colors.grey.shade900
                                      : const Color.fromRGBO(45, 53, 162, 1)
                                  : (themeMode == ThemeMode.dark)
                                      ? Colors.grey.shade800
                                      : Colors.white,
                              titleColor: (i == 0)
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : (themeMode == ThemeMode.dark)
                                      ? const Color.fromRGBO(255, 255, 255, 1)
                                      : const Color.fromRGBO(32, 48, 79, 1),
                              descriptionColor: (i == 0)
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : const Color.fromRGBO(183, 183, 183, 1),
                              taskTitle: data[i]['mainText']!,
                              taskDescription: data[i]['bottomText']!);
                        },
                        itemCount: 4,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
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
