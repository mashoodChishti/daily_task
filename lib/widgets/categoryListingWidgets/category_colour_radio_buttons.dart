import 'package:flutter/material.dart';

class CustomRadioWidget<T> extends StatefulWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;

  final LinearGradient? gradient;

  const CustomRadioWidget({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.gradient,
  }) : super(key: key);

  @override
  State<CustomRadioWidget<T>> createState() => _CustomRadioWidgetState<T>();
}

class _CustomRadioWidgetState<T> extends State<CustomRadioWidget<T>> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.value == widget.groupValue;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.onChanged(widget.value);
          });
        },
        child: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: isSelected ? Colors.blue : Colors.transparent,
                width: 3,
              ),
            ),
            gradient: widget.gradient,
          ),
          child: Center(
            child: Container(
              height: 50,
              width: 50,
              decoration: ShapeDecoration(
                  shape: const CircleBorder(), gradient: widget.gradient),
            ),
          ),
        ),
      ),
    );
  }
}
