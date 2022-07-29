import 'package:daily_task/widgets/commonWidgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../../provider/theme_provider.dart';

class TaskdetailWidget extends StatefulWidget {
  const TaskdetailWidget({Key? key}) : super(key: key);

  @override
  _TaskdetailWidgetState createState() => _TaskdetailWidgetState();
}

class _TaskdetailWidgetState extends State<TaskdetailWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = Provider.of<ThemeProvider>(context).themeMode;
    return Scaffold(
      appBar: AppBarWidget(
          itemsColor: (themeMode == ThemeMode.dark)
              ? Colors.white
              : const Color.fromRGBO(45, 53, 162, 1),
          titleText: 'Task Detail',
          buttonItemsColor: (themeMode == ThemeMode.dark)
              ? const Color.fromRGBO(45, 53, 162, 1)
              : Colors.white,
          backgroundColor: Theme.of(context).canvasColor),
      body: SafeArea(
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
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Headphone Landing Page',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w600,
                      height: 1),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ucup Studio',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 160,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Attachment',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Transform.rotate(
                            angle: -90.00000000000001 * (math.pi / 180),
                            child: const Icon(Icons.keyboard_arrow_left,
                                color: Color.fromRGBO(255, 255, 255, 1))),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Description',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w600,
                      height: 1),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Please create 1 Headphone  Landing Page and please make\nthe responsive version on iPhone size 375 x 812px. You canmexplore other\n\nIf there is something you don\'t understand, you can add a\ncomment below or chat on my telegram. good luck!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(196, 196, 196, 1),
                      fontFamily: 'Nunito',
                      fontSize: 12,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    width: 100,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: <Widget>[
                          const Text(
                            'Link',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Nunito',
                                fontSize: 16,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Transform.rotate(
                            angle: -90.00000000000001 * (math.pi / 180),
                            child: const Icon(Icons.keyboard_arrow_left,
                                color: Color.fromRGBO(255, 255, 255, 1)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Members',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w600,
                      height: 1),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(196, 196, 196, 1),
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(32, 32),
                        ),
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(196, 196, 196, 1),
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(32, 32),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(32, 32)),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 18,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Deadline',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w600,
                      height: 1),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'September 12, 21.00 AM',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(196, 196, 196, 1),
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                const SizedBox(
                  height: 140,
                ),
                Center(
                  child: InkWell(
                    child: Container(
                      width: 327,
                      height: 51,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: const Center(
                        child: Text(
                          'Add Comment',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'DM Sans',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
