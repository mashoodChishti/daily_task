import 'package:daily_task/page/category/category_page.dart';
import 'package:daily_task/page/taskDetail/task_detail_page.dart';
import 'package:daily_task/widgets/categoryListingWidgets/category_color_pallete.dart';
import 'package:daily_task/widgets/categoryListingWidgets/category_colour_radio_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetCustom extends StatefulWidget {
  const BottomSheetCustom(
      {Key? key, required this.list, this.ctx, required this.onChanged, required this.isEditMode})
      : super(key: key);
  final List<CategoryTile>? list;
  final BuildContext? ctx;
  final ValueChanged<List<CategoryTile>> onChanged;
  final bool isEditMode;
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
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        color: Colors.transparent,
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
            const Text("Category Color",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 10,
            ),
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
                CustomRadioWidget(
                  value: 3,
                  groupValue: color,
                  onChanged: _valueChangedHandler(),
                  gradient: blueGradient,
                ),
                CustomRadioWidget(
                  value: 4,
                  groupValue: color,
                  onChanged: _valueChangedHandler(),
                  gradient: redGradient,
                ),
                CustomRadioWidget(
                  value: 5,
                  groupValue: color,
                  onChanged: _valueChangedHandler(),
                  gradient: purpleGradient,
                ),
                CustomRadioWidget(
                  value: 6,
                  groupValue: color,
                  onChanged: _valueChangedHandler(),
                  gradient: blueGradient,
                ),
                CustomRadioWidget(
                  value: 7,
                  groupValue: color,
                  onChanged: _valueChangedHandler(),
                  gradient: redGradient,
                ),
                CustomRadioWidget(
                  value: 8,
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
                    Get.to(() => TaskdetailWidget(
                          title: catName!,
                          description: catDescription!,
                        ));
                  },
                  description: catDescription,
                ));
                Get.back();
                widget.onChanged(list);
              },
              child: const Text("Add Category"),
            ),
          ],
        )),
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
