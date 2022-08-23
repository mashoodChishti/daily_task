import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/category_tile_model.dart';
import '../../widgets/categoryListingWidgets/category_color_pallete.dart';
import '../../widgets/categoryListingWidgets/category_colour_radio_buttons.dart';
import '../taskDetail/task_detail_page.dart';

class CustomBottomSheetEdit extends StatefulWidget {
  const CustomBottomSheetEdit(
      {Key? key,
      required this.list,
      this.ctx,
      required this.onEdit,
      required this.index})
      : super(key: key);
  final List<CategoryTile>? list;
  final BuildContext? ctx;
  final void Function(List<CategoryTile>, CategoryTile, int) onEdit;
  final int index;

  @override
  State<CustomBottomSheetEdit> createState() => _CustomBottomSheetEditState();
}

class _CustomBottomSheetEditState extends State<CustomBottomSheetEdit> {
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
        // height: MediaQuery.of(context).size.height * 0.4,
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: list[widget.index].title,
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
              initialValue: list[widget.index].description,
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
                  gradient: orangePurpleGradient,
                ),
                CustomRadioWidget(
                  value: 4,
                  groupValue: color,
                  onChanged: _valueChangedHandler(),
                  gradient: greenGradient,
                ),
                CustomRadioWidget(
                  value: 5,
                  groupValue: color,
                  onChanged: _valueChangedHandler(),
                  gradient: yellowGradient,
                ),
                CustomRadioWidget(
                  value: 6,
                  groupValue: color,
                  onChanged: _valueChangedHandler(),
                  gradient: pinkGradient,
                ),
                CustomRadioWidget(
                  value: 7,
                  groupValue: color,
                  onChanged: _valueChangedHandler(),
                  gradient: brownGradient,
                ),
                CustomRadioWidget(
                  value: 8,
                  groupValue: color,
                  onChanged: _valueChangedHandler(),
                  gradient: greyGradient,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                final tile = CategoryTile(
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
                );
                Get.back();
                widget.onEdit(list, tile, widget.index);
              },
              child: const Text("Edit Category"),
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
    case 3:
      return Colors.orange;
    case 4:
      return Colors.green;
    case 5:
      return Colors.yellow;
    case 6:
      return Colors.pink;
    case 7:
      return Colors.brown;
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
    case 3:
      return orangePurpleGradient;
    case 4:
      return greenGradient;
    case 5:
      return yellowGradient;
    case 6:
      return pinkGradient;
    case 7:
      return brownGradient;
    default:
      return blueGradient;
  }
}
