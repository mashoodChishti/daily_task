import 'dart:io';

import 'package:daily_task/widgets/commonWidgets/appbar_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:math' as math;

import '../../provider/theme_provider.dart';

class TaskdetailWidget extends StatefulWidget {
  final String title;
  final String description;
  const TaskdetailWidget(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  _TaskdetailWidgetState createState() => _TaskdetailWidgetState();
}

class _TaskdetailWidgetState extends State<TaskdetailWidget> {
  List<File> _files = [];
  final List<String> _urls = [];
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );
      if (picked != null && picked != selectedTime) {
        setState(() {
          selectedTime = picked;
        });
      }
    }

    ThemeMode themeMode = Provider.of<ThemeProvider>(context).themeMode;
    return Scaffold(
      appBar: AppBarWidget(
        itemsColor: themeMode == ThemeMode.dark
            ? Colors.white
            : const Color(0xff2D35A2),
        titleText: 'Task Detail',
        buttonItemsColor: (themeMode == ThemeMode.dark)
            ? const Color.fromRGBO(45, 53, 162, 1)
            : Colors.white,
        backgroundColor: Theme.of(context).canvasColor,
        action: () {},
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w600,
                        height: 1),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      openAttachmentBottomSheet(context);
                    },
                    child: Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: <Widget>[
                          const Text(
                            'Attachment',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Nunito',
                                fontSize: 16,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Transform.rotate(
                              angle: -90.00000000000001 * (math.pi / 180),
                              child: const Icon(Icons.keyboard_arrow_left,
                                  color: Color.fromRGBO(255, 255, 255, 1))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Description',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w600,
                        height: 1),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter description',
                      hintStyle: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      openlinksBottomSheet(context);
                    },
                    child: Container(
                      width: 100,
                      height: 46,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            const Text(
                              'Link',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Transform.rotate(
                              angle: -90.00000000000001 * (math.pi / 180),
                              child: const Icon(Icons.keyboard_arrow_left,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Members',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w600,
                        height: 1),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(32, 32),
                          ),
                        ),
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(32, 32),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.elliptical(32, 32)),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 18,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                            const SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Deadline',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w600,
                        height: 1),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _selectDate(context);
                      await _selectTime(context);
                    },
                    child: Text(
                      // ignore: unnecessary_null_comparison
                      selectedDate == null
                          ? "Select Date"
                          : "${selectedDate.day}/${selectedDate.month}/${selectedDate.year} ${selectedTime.hour}:${selectedTime.minute}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  const SizedBox(
                    height: 140,
                  ),
                  Center(
                    child: InkWell(
                      child: Container(
                        width: 327,
                        height: 51,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                            bottomLeft: Radius.circular(14),
                            bottomRight: Radius.circular(14),
                          ),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: const Center(
                          child: Text(
                            'Add Comment',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'DM Sans',
                                fontSize: 16,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void openAttachmentBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(150),
          ),
        ),
        builder: (ctx) => SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("Add Attachments"),
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(allowMultiple: true);
                      if (result != null) {
                        _files =
                            result.paths.map((path) => File(path!)).toList();
                      }
                    }),
              ),
            ));
  }

  void openlinksBottomSheet(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    autofocus: false,
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter Url',
                      hintText: 'Enter the Url link',
                      suffixIcon: IconButton(
                        onPressed: () async {
                          if (_controller.text.toString() == "") {
                            if (kDebugMode) {
                              print("null data");
                            }
                          } else {
                            if (kDebugMode) {
                              print(_controller.text.toString());
                            }
                            if (await canLaunchUrlString(
                                "https://" + _controller.text.toString())) {
                              _urls.add(_controller.text.toString());
                              Get.back(closeOverlays: true);
                            } else {
                              throw 'Could not launch ${_controller.text.toString()}';
                            }
                          }
                        },
                        icon: const Icon(Icons.open_in_browser),
                      ),
                    ),
                    maxLength: 15,
                  ),
                ),
              ),
            ));
  }
}
