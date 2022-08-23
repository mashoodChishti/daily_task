import 'package:daily_task/page/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'introWidgets/intro_widget.dart';

class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
  final _controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 60),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            Container(
              color: const Color(0xff2D35A2),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const IntroWidget(
                        titleText: 'Manage Your Task',
                        description:
                            'Organize all your to-do’s in lists and project. Color tag them to set priorities and categories',
                        topIcon: Icon(
                          Icons.add_task,
                          color: Colors.white,
                        )),
                    MaterialButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut);
                      },
                      color: const Color(0xff52CCFF),
                      textColor: Colors.white,
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 45,
                      ),
                      padding: const EdgeInsets.all(5),
                      shape: const CircleBorder(),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color(0xff2D35A2),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const IntroWidget(
                        titleText: 'Set Task Reminder',
                        description:
                            'Organize all your to-do’s in lists and project. Color tag them to set priorities and categories',
                        topIcon: Icon(
                          Icons.timer,
                          color: Colors.white,
                        )),
                    MaterialButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut);
                      },
                      color: const Color(0xff52CCFF),
                      textColor: Colors.white,
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 45,
                      ),
                      padding: const EdgeInsets.all(5),
                      shape: const CircleBorder(),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color(0xff2D35A2),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const IntroWidget(
                        titleText: 'Analyz Performence',
                        description:
                            'Organize all your to-do’s in lists and project. Color tag them to set priorities and categories',
                        topIcon: Icon(
                          Icons.stacked_bar_chart_rounded,
                          color: Colors.white,
                        )),
                    MaterialButton(
                      onPressed: () {
                        setState(() {});
                      },
                      color: const Color(0xff52CCFF),
                      textColor: Colors.white,
                      child: const Icon(
                        Icons.arrow_downward,
                        size: 45,
                      ),
                      padding: const EdgeInsets.all(5),
                      shape: const CircleBorder(),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              color: const Color(0xff2D35A2),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextButton(
                  onPressed: () async {
                    final pref = await SharedPreferences.getInstance();
                    pref.setBool('showHome', true);
                    Get.to(() => const LoginScreen());
                  },
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(31.0)),
                      primary: Colors.white,
                      backgroundColor: const Color(0xff52CCFF),
                      minimumSize: const Size.fromHeight(60)),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 24),
                  )),
            )
          : Container(
              color: const Color(0xff2D35A2),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style: ButtonStyle(
                          //minimumSize: MaterialStateProperty.all(Size(80, 60)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff52CCFF))),
                      onPressed: () => _controller.jumpToPage(2),
                      child: const Text('SKIP',
                          style: TextStyle(color: Colors.white, fontSize: 16))),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: Center(
                        child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const WormEffect(
                          spacing: 16,
                          dotColor: Colors.white,
                          activeDotColor: Color(0xff52CCFF)),
                      onDotClicked: (index) => _controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut),
                    )),
                  ),
                  TextButton(
                      style: ButtonStyle(
                          //minimumSize: MaterialStateProperty.all(Size(80, 60)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff52CCFF))),
                      onPressed: () => _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut),
                      child: const Text(
                        'NEXT',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))
                ],
              ),
            ),
    );
  }
}
