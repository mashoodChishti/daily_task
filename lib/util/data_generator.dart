import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/category_tile_model.dart';
import '../page/taskDetail/task_detail_page.dart';
import '../widgets/categoryListingWidgets/category_color_pallete.dart';

List<CategoryTile> getCategoryTileList() {
  List<CategoryTile> list = [
    CategoryTile(
      title: "Today",
      color: Colors.blue,
      gradient: blueGradient,
      onTap: () {
        Get.to(() => const TaskdetailWidget(
              title: "today",
              description: "Today's tasks",
            ));
      },
      description: "Today's tasks",
    ),
    CategoryTile(
      title: "Tomorrow",
      color: Colors.purple,
      gradient: purpleGradient,
      onTap: () {
        Get.to(() => const TaskdetailWidget(
              title: "Tommorow",
              description: "Tommorow's tasks",
            ));
      },
      description: "Tomorrow's tasks",
    ),
    CategoryTile(
      title: "Next Week",
      color: Colors.red,
      gradient: redGradient,
      onTap: () {
        Get.to(() => const TaskdetailWidget(
              title: 'Next Week',
              description: "Next week's tasks",
            ));
      },
      description: "Next week's tasks",
    ),
  ];
  return list;
}
