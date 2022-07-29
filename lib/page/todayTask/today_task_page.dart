import 'package:daily_task/widgets/todayTaskWidgets/task_tile.dart';
import 'package:flutter/material.dart';

class TodayTaskPage extends StatefulWidget {
  const TodayTaskPage({Key? key}) : super(key: key);

  @override
  State<TodayTaskPage> createState() => _TodayTaskPageState();
}

class _TodayTaskPageState extends State<TodayTaskPage> {
  var data = [
    {
      "mainText": "Mobile app prototype",
      "bottomText": "Make mobile app\nuntil prototype"
    },
    {
      "mainText": "Medical Dashboard",
      "bottomText": "Make medical\nwith source file"
    },
    {
      "mainText": "Landing page with responsive",
      "bottomText": "Landing page size macbook\nand responsive"
    },
    {
      "mainText": "Mobile app prototype",
      "bottomText": "Make mobile app\nuntil prototype"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromRGBO(45, 53, 162, 1),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Today Task',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(45, 53, 162, 1),
              fontFamily: 'Nunito',
              fontSize: 24,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.w600,
              height: 1),
        ),
        actions: [
          TextButton(
            child: SizedBox(
              width: 32,
              height: 32,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        color: Color.fromRGBO(45, 53, 162, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 11,
                    left: 11,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 17,
                    left: 11,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 11,
                    left: 17,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 17,
                    left: 17,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Today',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(32, 48, 79, 1),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w600,
                      height: 1),
                ),
                const SizedBox(
                  height: 60,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return TaskTile(
                        tileColor: (i == 0)
                            ? const Color.fromRGBO(45, 53, 162, 1)
                            : Colors.white,
                        titleColor: (i == 0)
                            ? const Color.fromRGBO(255, 255, 255, 1)
                            : const Color.fromRGBO(32, 48, 79, 1),
                        descriptionColor: (i == 0)
                            ? const Color.fromRGBO(255, 255, 255, 1)
                            : const Color.fromRGBO(183, 183, 183, 1),
                        taskTitle: data[i]['mainText']!,
                        taskDescription: data[i]['bottomText']!);
                  },
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
