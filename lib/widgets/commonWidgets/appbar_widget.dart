import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.itemsColor,
    required this.titleText,
    required this.buttonItemsColor,
    required this.backgroundColor,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0
  final Color itemsColor;
  final String titleText;
  final Color buttonItemsColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: itemsColor),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        titleText,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: itemsColor,
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
                      color: itemsColor,
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
                      color: buttonItemsColor,
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
                      color: buttonItemsColor,
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
                      color: buttonItemsColor,
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
                      color: buttonItemsColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
