import 'package:daily_task/page/taskDetail/task_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// QuickActions represents the horizontal list of rectangular buttons below the header
class CategoryListingWidget extends StatelessWidget {
  const CategoryListingWidget({Key? key}) : super(key: key);

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
      constraints: const BoxConstraints(maxHeight: 90.0),
      child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(
              left: 0.0, bottom: 20.0, right: 0.0, top: 10.0),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _buildAction("Landing Page", () {
              Get.to(const TaskdetailWidget());
            }, Colors.blue, blueGradient,
                const AssetImage("assets/images/microphone.png")),
            _buildAction("Mobile App", () {
              Get.to(const TaskdetailWidget());
            }, Colors.purple, purpleGraient,
                const AssetImage("assets/images/wallet.png")),
            _buildAction("Logo Design", () {
              Get.to(const TaskdetailWidget());
            }, Colors.red, redGradient,
                const AssetImage("assets/images/joystick.png")),
            _buildAction("Landing Page", () {
              Get.to(const TaskdetailWidget());
            }, Colors.blue, blueGradient,
                const AssetImage("assets/images/microphone.png")),
            _buildAction("Mobile App", () {
              Get.to(const TaskdetailWidget());
            }, Colors.purple, purpleGraient,
                const AssetImage("assets/images/wallet.png")),
            _buildAction("Logo Design", () {
              Get.to(const TaskdetailWidget());
            }, Colors.red, redGradient,
                const AssetImage("assets/images/joystick.png")),
            _buildAction("Mobile App", () {
              Get.to(const TaskdetailWidget());
            }, Colors.purple, purpleGraient,
                const AssetImage("assets/images/wallet.png")),
          ]),
    );
  }

  Widget _buildAction(String title, VoidCallback action, Color color,
      Gradient gradient, ImageProvider backgroundImage) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
      //fontFamily: ProfileFontNames.
    );
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Card(
        elevation: 20,
        shadowColor: Colors.white30,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: SizedBox(
          width: double.infinity,
          height: 96,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 5,
                    height: 55,
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xff2D35A2),
                    ),
                    child: const Text(''),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, top: 18),
                    child: Text(title,
                        style: textStyle.copyWith(color: Colors.black)),
                  ),
                  // Container(
                  //   alignment: Alignment.bottomLeft,
                  //   padding: const EdgeInsets.only(top: 65, left: 10),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.calendar_month_rounded,
                  //         color: Colors.white,
                  //         size: 16.0,
                  //         semanticLabel:
                  //             'Text to announce in accessibility modes',
                  //       ),
                  //       Text('06/12/2022',
                  //           style:
                  //               TextStyle(fontSize: 12, color: Colors.white)),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.bottomCenter,
                  //   padding: const EdgeInsets.only(top: 65, left: 125),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.task_alt_rounded,
                  //         color: Colors.white,
                  //         size: 16.0,
                  //         semanticLabel:
                  //             'Text to announce in accessibility modes',
                  //       ),
                  //       Text('Tasks(13)',
                  //           style:
                  //               TextStyle(fontSize: 12, color: Colors.white)),
                  //     ],
                  //   ),
                  // ),
                ],
              ) //Text
            ],
          ), //Padding
        ), //SizedBox
      ),
    ); //Card
    // return GestureDetector(
    //   onTap: action,
    //   child: Container(
    //     margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //         color: Colors.white,
    //         //color: color,
    //         shape: BoxShape.rectangle,
    //         borderRadius: BorderRadius.circular(15.0),
    //         boxShadow: const <BoxShadow>[
    //           BoxShadow(
    //               color: Colors.black38,
    //               blurRadius: 0.5,
    //               spreadRadius: 0.5,
    //               offset: Offset(0.0, 1.0)),
    //         ],
    //         gradient: gradient),
    //     child: Stack(
    //       children: <Widget>[
    //         Opacity(
    //           opacity: 0.2,
    //           child: Align(
    //             alignment: Alignment.centerRight,
    //             child: Transform.rotate(
    //               angle: -3.1428 / 12,
    //               alignment: Alignment.centerRight,
    //               child: ClipPath(
    //                 //clipper: _BackgroundImageClipper(),
    //                 child: Container(
    //                   padding: const EdgeInsets.only(
    //                       bottom: 20.0, right: 10.0, left: 60.0),
    //                   child: Image(
    //                     width: 70.0,
    //                     height: 70.0,
    //                     image: backgroundImage,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ), // END BACKGROUND IMAGE
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Container(
    //               alignment: Alignment.topLeft,
    //               padding: const EdgeInsets.only(left: 10.0, top: 10.0),
    //               child: Text(title, style: textStyle),
    //             ),
    //             Container(
    //               alignment: Alignment.topRight,
    //               padding: const EdgeInsets.only(right: 20.0, top: 10.0),
    //               child: Text('Upcomming (2)'),
    //             ),
    //           ],
    //         ),
    //         Container(
    //           alignment: Alignment.bottomLeft,
    //           padding: const EdgeInsets.only(top: 65, left: 10),
    //           child: Row(
    //             children: [
    //               Icon(
    //                 Icons.calendar_month_rounded,
    //                 color: Colors.white,
    //                 size: 16.0,
    //                 semanticLabel: 'Text to announce in accessibility modes',
    //               ),
    //               Text('06/12/2022',
    //                   style: TextStyle(fontSize: 12, color: Colors.white)),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           alignment: Alignment.bottomCenter,
    //           padding: const EdgeInsets.only(top: 65, left: 125),
    //           child: Row(
    //             children: [
    //               Icon(
    //                 Icons.task_alt_rounded,
    //                 color: Colors.white,
    //                 size: 16.0,
    //                 semanticLabel: 'Text to announce in accessibility modes',
    //               ),
    //               Text('Tasks(13)',
    //                   style: TextStyle(fontSize: 12, color: Colors.white)),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           alignment: Alignment.centerRight,
    //           padding: const EdgeInsets.only(top: 65, left: 220),
    //           child: Row(
    //             children: [
    //               Icon(
    //                 Icons.done_all_rounded,
    //                 color: Colors.white,
    //                 size: 16.0,
    //                 semanticLabel: 'Text to announce in accessibility modes',
    //               ),
    //               Text('Completed (9)',
    //                   style: TextStyle(fontSize: 12, color: Colors.white)),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

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
