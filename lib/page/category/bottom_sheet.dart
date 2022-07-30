import 'package:daily_task/page/category/category_page.dart';
import 'package:daily_task/page/taskDetail/task_detail_page.dart';
import 'package:daily_task/widgets/categoryListingWidgets/category_color_pallete.dart';
import 'package:daily_task/widgets/categoryListingWidgets/category_colour_radio_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetCustom extends StatefulWidget {
  const BottomSheetCustom({Key? key, required this.list}) : super(key: key);
  final List<CategoryTile>? list;

  @override
  State<BottomSheetCustom> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheetCustom> {
  int color = 0;
  ValueChanged<int> _valueChangedHandler() {
    return (value) => setState(() => color = value);
  }

  String? catName;
  String? catDescription;
  @override
  Widget build(BuildContext context) {
    List<CategoryTile> list = widget.list!;

    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 350,
          alignment: Alignment.center,
          color: Colors.white,
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: ((value) {
                  setState(() {
                    catName = value;
                  });
                }),
                decoration: const InputDecoration(
                  labelText: "Category Name",
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: ((value) {
                  setState(() {
                    catDescription = value;
                  });
                }),
                decoration: const InputDecoration(
                  labelText: "Category Description",
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Category Colour",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                children: [
                  CustomRadioWidget(
                    value: 0,
                    groupValue: color,
                    onChanged: _valueChangedHandler(),
                    gradient: blueGradient,
                  ),
                  CustomRadioWidget(
                    value: 1,
                    groupValue: color,
                    onChanged: _valueChangedHandler(),
                    gradient: redGradient,
                  ),
                  CustomRadioWidget(
                    value: 2,
                    groupValue: color,
                    onChanged: _valueChangedHandler(),
                    gradient: purpleGradient,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  list.add(CategoryTile(
                    title: catName,
                    color: getColor(color),
                    gradient: getGradient(color),
                    onTap: () {
                      Get.to(() => const TaskdetailWidget());
                    },
                    description: catDescription,
                  ));
                  Get.to(() => CategoryPage(list: list));
                },
                child: const Text("Add Category"),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

getColor(int color) {
  switch (color) {
    case 0:
      return Colors.blue;
    case 1:
      return Colors.red;
    case 2:
      return Colors.purple;
    default:
      return Colors.blue;
  }
}

getGradient(int color) {
  switch (color) {
    case 0:
      return blueGradient;
    case 1:
      return redGradient;
    case 2:
      return purpleGradient;
    default:
      return blueGradient;
  }
}
