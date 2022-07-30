import 'package:flutter/material.dart';

class CustomRadioWidget<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double width;
  final double height;
  final LinearGradient? gradient;

  const CustomRadioWidget(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.gradient,
      this.width = 32,
      this.height = 32})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onChanged(value);
        },
        child: Container(
          height: height,
          width: width,
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
            gradient: LinearGradient(
              colors: [
                Color(0xFF49EF3E),
                Color(0xFF06D89A),
              ],
            ),
          ),
          child: Center(
            child: Container(
              height: height - 8,
              width: width - 8,
              decoration: ShapeDecoration(
                  shape: const CircleBorder(), gradient: gradient),
            ),
          ),
        ),
      ),
    );
  }
}
