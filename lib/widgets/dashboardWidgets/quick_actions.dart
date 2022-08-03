import 'package:daily_task/page/todayTask/today_task_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// QuickActions represents the horizontal list of rectangular buttons below the header
class QuickActions extends StatelessWidget {
  const QuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const blueGradient = LinearGradient(colors: <Color>[
      Color(0xFF0075D1),
      Color(0xFF00A2E3),
    ], stops: <double>[
      0.4,
      0.6
    ], begin: Alignment.topRight, end: Alignment.bottomLeft);
    const purpleGraient = LinearGradient(
        colors: <Color>[Color(0xFF882DEB), Color(0xFF9A4DFF)],
        stops: <double>[0.5, 0.7],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight);
    const redGradient = LinearGradient(colors: <Color>[
      Color(0xFFBA110E),
      Color(0xFFCF3110),
    ], stops: <double>[
      0.6,
      0.8
    ], begin: Alignment.bottomRight, end: Alignment.topLeft);

    return Container(
      constraints: const BoxConstraints(maxHeight: 140.0),
      margin: const EdgeInsets.only(top: 10.0),
      child: Align(
        alignment: Alignment.center,
        child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
                left: 0.0, bottom: 20.0, right: 0.0, top: 10.0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildAction("Live\nBroadcast", () {
                Get.to(() => const TodayTaskPage());
              }, Colors.blue, blueGradient,
                  const AssetImage("assets/images/microphone.png")),
              _buildAction("My\nWallet", () {
                Get.to(() => const TodayTaskPage());
              }, Colors.purple, purpleGraient,
                  const AssetImage("assets/images/wallet.png")),
              _buildAction("Game\nCenter", () {
                Get.to(() => const TodayTaskPage());
              }, Colors.red, redGradient,
                  const AssetImage("assets/images/joystick.png")),
              _buildAction("Live\nBroadcast", () {
                Get.to(() => const TodayTaskPage());
              }, Colors.blue, blueGradient,
                  const AssetImage("assets/images/microphone.png")),
            ]),
      ),
    );
  }

  Widget _buildAction(String title, VoidCallback action, Color color,
      Gradient gradient, ImageProvider backgroundImage) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 18.0,
      //fontFamily: ProfileFontNames.
    );

    return GestureDetector(
      onTap: action,
      child: Container(
        margin: const EdgeInsets.only(right: 5.0, left: 5.0),
        width: 180.0,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15.0),
            // boxShadow: const <BoxShadow>[
            //   BoxShadow(
            //       color: Colors.black45,
            //       blurRadius: 0.5,
            //       spreadRadius: 0.5,
            //       offset: Offset(0.0, 1.0)),
            // ],
            gradient: gradient),
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.2,
              child: Align(
                alignment: Alignment.centerRight,
                child: Transform.rotate(
                  angle: -3.1428 / 12,
                  alignment: Alignment.centerRight,
                  child: ClipPath(
                    //clipper: _BackgroundImageClipper(),
                    child: Container(
                      padding: const EdgeInsets.only(
                          bottom: 20.0, right: 0.0, left: 60.0),
                      child: Image(
                        width: 70.0,
                        height: 70.0,
                        image: backgroundImage,
                      ),
                    ),
                  ),
                ),
              ),
            ), // END BACKGROUND IMAGE

            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(title, style: textStyle),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 10),
              child: const Text('10 Task',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: unused_element
class _BackgroundImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
