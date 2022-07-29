import 'package:daily_task/page/category/category_page.dart';
import 'package:daily_task/widgets/dashboardWidgets/quick_actions.dart';
import 'package:daily_task/widgets/dashboardWidgets/recent_activities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardActivitiesSectionWidget extends StatefulWidget {
  const DashboardActivitiesSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardActivitiesSectionWidget> createState() =>
      _DashboardActivitiesSectionWidgetState();
}

class _DashboardActivitiesSectionWidgetState
    extends State<DashboardActivitiesSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        width: double.infinity,
        //padding: EdgeInsets.only(left: 12.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0)),
            color: Theme.of(context).canvasColor),
        height: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    const Text('My tasks',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: InkWell(
                        splashColor: Colors.red,
                        highlightColor: Colors.yellow,
                        onTap: () {
                          Get.to(const CategoryPage());
                        },
                        child: const Text('See all',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffFDCCC5))),
                      ),
                    ),
                  ],
                ),
              ),
              const QuickActions(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Text('Recent Activities',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              const Expanded(child: RecentActivities())
            ],
          ),
        ),
      ),
    );
  }
}
