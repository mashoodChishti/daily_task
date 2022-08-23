import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage("assets/images/bg_395.png"),
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
            colorFilter: ColorFilter.mode(
                const Color(0x00e8e8e8).withOpacity(0.8), BlendMode.lighten)),
      ),
    );
  }
}
