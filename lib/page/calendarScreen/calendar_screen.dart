import 'package:daily_task/widgets/commonWidgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = Provider.of<ThemeProvider>(context).themeMode;
    return Scaffold(
      appBar: AppBarWidget(
          itemsColor:
              (themeMode == ThemeMode.dark) ? Colors.white : Colors.white,
          titleText: "Calendar",
          buttonItemsColor: (themeMode == ThemeMode.dark)
              ? const Color.fromRGBO(45, 53, 162, 1)
              : const Color.fromRGBO(45, 53, 162, 1),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
