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
