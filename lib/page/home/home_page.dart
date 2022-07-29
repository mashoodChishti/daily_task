import 'package:daily_task/widgets/buttonWidgets/change_theme_button_widget.dart';
import 'package:daily_task/widgets/dashboardWidgets/dashboard_activities_section_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int counter = 3;
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu_rounded),
        elevation: 0,
        actions: [
          const ChangeThemeButtonWidget(),
          // Using Stack to show Notification Badge
          Stack(
            children: <Widget>[
              IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {
                    setState(() {
                      counter = 0;
                    });
                  }),
              counter != 0
                  ? Positioned(
                      right: 10,
                      top: 21,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Text(
                          '$counter',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Text('Let' 's manage your task \neasily with us',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text('Manage tasks with good features',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffC4C4C4).withOpacity(0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  suffixIcon: Icon(
                    Icons.mic,
                    size: 30,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Theme.of(context).hintColor),
                  //contentPadding: EdgeInsets.all(8),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onChanged: (value) {
                  // do something
                },
              ),
            ),
          ),
          const DashboardActivitiesSectionWidget(),
        ],
      ),
    );
  }
}