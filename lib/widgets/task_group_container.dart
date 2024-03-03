import 'package:flutter/material.dart';

import '../screens/change_task_status_page/change_task_status_page_provider.dart';
import '../themes/custom_colors.dart';
import 'rounded_progress_indicator.dart';

class TaskGroupContainer extends StatelessWidget {
  final String title;
  final int numOfTasks;
  final double prasentage;
  const TaskGroupContainer({
    super.key,
    required this.title,
    required this.prasentage,
    required this.numOfTasks,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => ChangeTaskStatusPageProvider(
                    appBarTitle: title,
                  )),
        );
      },
      child: Container(
        width: double.infinity,
        height: 80.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: CustomColors.BACKGROUND,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/work.png',
              fit: BoxFit.cover,
              width: 30.0,
              height: 30.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: CustomColors.SURFACED,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '$numOfTasks tasks',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: CustomColors.SECONDARY,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            RoundedProgressIndicator(
              value: prasentage,
            )
          ],
        ),
      ),
    );
  }
}
