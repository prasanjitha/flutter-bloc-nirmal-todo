import 'package:flutter/material.dart';

import '../themes/custom_colors.dart';

class TaskDetails extends StatelessWidget {
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String type;
  const TaskDetails({
    super.key,
    required this.description,
    required this.endDate,
    required this.startDate,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
        bottom: 10.0,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(
          20.0,
        ),
        decoration: BoxDecoration(
          color: CustomColors.SCAFFOLD,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: CustomColors.SURFACED,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: CustomColors.SURFACED,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: CustomColors.SECONDARY,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  'start Date :',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: CustomColors.SECONDARY,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Text(
                  startDate,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: CustomColors.PRIMARY,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  'End Date :',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: CustomColors.SECONDARY,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Text(
                  endDate,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: CustomColors.PRIMARY,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
