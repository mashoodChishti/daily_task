
import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({Key? key, this.titleText, this.description, this.topIcon})
      : super(key: key);
  final String? titleText;
  final String? description;
  final Widget? topIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            iconSize: 72,
            icon: topIcon!),
        const SizedBox(
          height: 10,
        ),
        Text(titleText!,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto')),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 200,
          child: Text(
              description!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Roboto')),
        ),
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
