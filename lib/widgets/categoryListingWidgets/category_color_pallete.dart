import 'package:flutter/material.dart';

const blueGradient = LinearGradient(colors: <Color>[
  Color(0xFF0075D1),
  Color(0xFF00A2E3),
], stops: <double>[
  0.4,
  0.6
], begin: Alignment.topRight, end: Alignment.bottomLeft);
const purpleGradient = LinearGradient(
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
const orangePurpleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.purple, Colors.orange]);
const greenGradient = LinearGradient(
  colors: [Color(0xff5bb85f), Color(0xffaddbaf)],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
const yellowGradient = LinearGradient(
  colors: [Color(0xffFBB034), Color(0xffFABB34)],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
const orangeGradient = LinearGradient(
  colors: [Color(0xffeb8c00), Color(0xffffdfb1)],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
const pinkGradient = LinearGradient(
  colors: [Color(0xffbe3ed4), Color(0xfffcdbe6)],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);

const greyGradient = LinearGradient(
  colors: [Color(0xff5d5d5d), Color(0xffe8e8e8)],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
const brownGradient = LinearGradient(
  colors: [Color(0xff4a342c), Color(0xffe2d3ce)],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
