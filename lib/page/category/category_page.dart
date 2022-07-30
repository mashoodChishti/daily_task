import 'package:daily_task/page/category/bottom_sheet.dart';
import 'package:daily_task/page/taskDetail/task_detail_page.dart';
import 'package:daily_task/widgets/categoryListingWidgets/category_color_pallete.dart';
import 'package:daily_task/widgets/categoryListingWidgets/category_listing_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  final List<CategoryTile>? list;

  const CategoryPage({
    Key? key,
    this.list,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

List<CategoryTile> list = [
  CategoryTile(
    title: "Today",
    color: Colors.blue,
    gradient: blueGradient,
    onTap: () {
      Get.to(() => const TaskdetailWidget());
    },
    description: "Today's tasks",
  ),
  CategoryTile(
    title: "Tomorrow",
    color: Colors.purple,
    gradient: purpleGradient,
    onTap: () {
      Get.to(() => const TaskdetailWidget());
    },
    description: "Tomorrow's tasks",
  ),
  CategoryTile(
    title: "Next Week",
    color: Colors.red,
    gradient: redGradient,
    onTap: () {
      Get.to(() => const TaskdetailWidget());
    },
    description: "Next week's tasks",
  ),
];

class _CategoryPageState extends State<CategoryPage> {
  addCategory() {
    list.add(CategoryTile(
      title: "Next Week",
      color: Colors.red,
      gradient: redGradient,
      onTap: () {
        Get.to(() => const TaskdetailWidget());
      },
      description: "Next week's tasks",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
          child: Text(
            'Categories',
            style: TextStyle(
              letterSpacing: 1.0,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff2D35A2),
            ),
          ),
        ),
        iconTheme: Theme.of(context).iconTheme,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        actions: [
          SizedBox(
            width: 58,
            child: PopupMenuButton(
              icon: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                backgroundColor: Color(0xffC4C4C4),
              ),
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: '1',
                    child: Text('Profile'),
                  ),
                  const PopupMenuItem<String>(
                    value: '2',
                    child: Text('Log Out'),
                  ),
                ];
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: CategoryListingWidget(
              list: list,
            )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(140, 51)),
                      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (_) {
                        return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14));
                      }),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromRGBO(82, 204, 255, 1)),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff2D35A2))),
                  onPressed: () => {_showModalBottomSheet(list)},
                  child: const Text('Create Category',
                      style: TextStyle(color: Colors.white, fontSize: 16))),
            )
          ],
        ),
      ),
    );
  }

  _showModalBottomSheet(List<CategoryTile> list) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(150),
        ),
      ),
      builder: (context) {
        return BottomSheetCustom(
          list: list,
        );
      },
    );
  }
}

class CategoryTile {
  String? title;
  String? description;
  String? image;
  Color? color;
  String? date;
  String? tasks;
  String? completed;
  LinearGradient? gradient;
  Function()? onTap;
  CategoryTile(
      {this.title,
      this.description,
      this.image,
      this.color,
      this.date,
      this.tasks,
      this.completed,
      this.gradient,
      this.onTap});
}
