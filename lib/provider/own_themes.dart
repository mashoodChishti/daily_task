import 'package:flutter/material.dart';

class OwnThemeFields {
  final Color? textColor;

  // ignore: prefer_initializing_formals
  const OwnThemeFields({Color? textColor}) : textColor = textColor;

  factory OwnThemeFields.empty() {
    return const OwnThemeFields(textColor: Colors.black);
  }
}

extension ThemeDataExtensions on ThemeData {
  static final Map<InputDecorationTheme, OwnThemeFields> _own = {};

  void addOwn(OwnThemeFields own) {
    _own[inputDecorationTheme] = own;
  }

  static OwnThemeFields? empty;

  OwnThemeFields own() {
    var o = _own[inputDecorationTheme];
    if (o == null) {
      empty ??= OwnThemeFields.empty();
      o = empty;
    }
    return o!;
  }
}

OwnThemeFields ownTheme(BuildContext context) => Theme.of(context).own();
