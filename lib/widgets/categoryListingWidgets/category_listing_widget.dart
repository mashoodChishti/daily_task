import 'package:daily_task/page/category/category_page.dart';
import 'package:daily_task/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../page/category/bottom_sheet_edit.dart';

/// QuickActions represents the horizontal list of rectangular buttons below the header

class CategoryListingWidget extends StatefulWidget {
  const CategoryListingWidget(
      {Key? key, required this.list, required this.updateList})
      : super(key: key);
  final List<CategoryTile> list;
  final Function(List<CategoryTile> newValue, CategoryTile tile, int index)
      updateList;

  @override
  State<CategoryListingWidget> createState() => _CategoryListingWidgetState();
}

CategoryTile? tile;

class _CategoryListingWidgetState extends State<CategoryListingWidget> {
  List<CategoryTile> _deleteTile(List<CategoryTile> newValue, int index) {
    tile = newValue.removeAt(index);
    return newValue;
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = Provider.of<ThemeProvider>(context).themeMode;
    List<CategoryTile> newList = widget.list;
    return Container(
      constraints: const BoxConstraints(maxHeight: 90.0),
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(
            left: 0.0, bottom: 20.0, right: 0.0, top: 10.0),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, i) {
          String categoryTitle = widget.list[i].title!;
          return Slidable(
            key: const ValueKey(0),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              //dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    setState(() {
                      list = _deleteTile(newList, i);
                    });
                    Get.to(() => CategoryPage(
                          list: list,
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(categoryTitle + ' has been deleted'),
                        action: SnackBarAction(
                          textColor: themeMode == ThemeMode.dark
                              ? Colors.grey.shade600
                              : Colors.white,
                          label: 'Undo',
                          onPressed: () {
                            setState(() {
                              list.insertAll(i, [tile!]);
                            });
                            Get.to(() => CategoryPage(
                                  list: list,
                                ));
                          },
                        ),
                      ),
                    );
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                  borderRadius: BorderRadius.circular(24),
                ),
                const SizedBox(
                  width: 5,
                ),
                SlidableAction(
                  onPressed: (context) {
                    _showModalBottomSheetEdit(widget.list, context, i);
                  },
                  backgroundColor: const Color(0xff2D35A2),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                  borderRadius: BorderRadius.circular(24),
                ),
              ],
            ),
            child: _buildAction(
                widget.list[i].title!,
                widget.list[i].onTap!,
                widget.list[i].color!,
                widget.list[i].gradient!,
                widget.list[i].description!,
                themeMode),
          );
        },
        // separatorBuilder: (context, i) => const SizedBox(height: 10.0),
        itemCount: widget.list.length,
      ),
    );
  }

  Widget _buildAction(String title, VoidCallback action, Color color,
      Gradient gradient, String? description, ThemeMode themeMode) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
      //fontFamily: ProfileFontNames.
    );
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Card(
        elevation: 20,
        shadowColor:
            themeMode == ThemeMode.dark ? Colors.grey.shade600 : Colors.white30,
        color:
            themeMode == ThemeMode.dark ? Colors.grey.shade900 : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: SizedBox(
          width: double.infinity,
          height: 96,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 5,
                    height: 55,
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: gradient,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 18),
                        child: Text(title,
                            style: textStyle.copyWith(
                                color: themeMode == ThemeMode.dark
                                    ? Colors.white
                                    : Colors.black)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: Text(description!,
                            style: textStyle.copyWith(
                                color: const Color.fromRGBO(183, 183, 183, 1),
                                fontSize: 10)),
                      ),
                    ],
                  ),
                  // Container(
                  //   alignment: Alignment.bottomLeft,
                  //   padding: const EdgeInsets.only(top: 65, left: 10),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.calendar_month_rounded,
                  //         color: Colors.white,
                  //         size: 16.0,
                  //         semanticLabel:
                  //             'Text to announce in accessibility modes',
                  //       ),
                  //       Text('06/12/2022',
                  //           style:
                  //               TextStyle(fontSize: 12, color: Colors.white)),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.bottomCenter,
                  //   padding: const EdgeInsets.only(top: 65, left: 125),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.task_alt_rounded,
                  //         color: Colors.white,
                  //         size: 16.0,
                  //         semanticLabel:
                  //             'Text to announce in accessibility modes',
                  //       ),
                  //       Text('Tasks(13)',
                  //           style:
                  //               TextStyle(fontSize: 12, color: Colors.white)),
                  //     ],
                  //   ),
                  // ),
                ],
              ) //Text
            ],
          ), //Padding
        ), //SizedBox
      ),
    ); //Card
  }

  _showModalBottomSheetEdit(
      List<CategoryTile> list, BuildContext context, int i) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: WidgetsBinding.instance.window.viewInsets.bottom,
          ),
          child: Wrap(children: <Widget>[
            CustomBottomSheetEdit(
              list: list,
              ctx: ctx,
              onEdit: widget.updateList,
              index: i,
            ),
          ]),
        );
      },
    );
  }
}

// ignore: unused_element
class _BackgroundImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
