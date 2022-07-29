import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final Color titleColor;
  final Color tileColor;
  final Color descriptionColor;
  final String taskTitle;
  final String taskDescription;
  const TaskTile(
      {Key? key,
      required this.titleColor,
      required this.descriptionColor,
      required this.taskTitle,
      required this.tileColor,
      required this.taskDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(14, 12, 35, 0.029999999329447746),
              offset: Offset(0, 8),
              blurRadius: 24)
        ],
        color: tileColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 52,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                color: Color.fromRGBO(82, 204, 255, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    taskTitle,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: titleColor,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w600,
                        height: 1),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    taskDescription,
                    textHeightBehavior: const TextHeightBehavior(
                      applyHeightToFirstAscent: true,
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: descriptionColor,
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
