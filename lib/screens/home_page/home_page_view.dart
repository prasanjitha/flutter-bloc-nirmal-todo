import 'package:flutter/material.dart';

import '../../themes/custom_colors.dart';
import '../../widgets/inprogress_item_container.dart';
import '../../widgets/item_category.dart';
import '../../widgets/task_group_container.dart';
import '../../widgets/today_done_task.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Image.asset(
            'assets/images/add_task_bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 60.0,
              left: 20.0,
              right: 20.0,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Hello!",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: CustomColors.SURFACED,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const TodaysDonTaskContainer(),
              const SizedBox(
                height: 20.0,
              ),
              const ItemCategory(
                title: "In Progress",
                count: 6,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    InProgressItemContainer(
                      category: "Office Tasks",
                      taskName: "Grocery shopping app design",
                      prasentage: 0.6,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    InProgressItemContainer(
                      category: "Personal Tasks",
                      taskName: "Reding Story Book",
                      prasentage: 0.8,
                      bgColor: CustomColors.EIGHTEEN,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    InProgressItemContainer(
                      category: "Other Tasks",
                      taskName: "Build a new website",
                      prasentage: 0.2,
                      bgColor: CustomColors.ORANGE,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const ItemCategory(
                title: "Task Groups",
                count: 3,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const TaskGroupContainer(
                title: 'Office Tasks',
                prasentage: 0.7,
                numOfTasks: 10,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const TaskGroupContainer(
                title: 'Personal Tasks',
                prasentage: 0.2,
                numOfTasks: 23,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const TaskGroupContainer(
                title: 'Other Tasks',
                prasentage: 0.3,
                numOfTasks: 23,
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
