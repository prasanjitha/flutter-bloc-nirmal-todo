import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes/custom_colors.dart';
import '../screens/change_task_status_page/change_task_status_page_bloc.dart';
import '../screens/change_task_status_page/change_task_status_page_event.dart';
import 'task_status_dropdown.dart';

class TodoItemContainer extends StatelessWidget {
  final String title;
  final String description;
  final String createdDateAndTime;
  final String startDate;
  final String endDate;
  final String status;
  final String keyId;
  const TodoItemContainer({
    super.key,
    required this.title,
    required this.description,
    required this.createdDateAndTime,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.keyId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200.0,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: CustomColors.SURFACED,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: 200.0,
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: CustomColors.SECONDARY,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
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
                  SizedBox(
                    width: 120.0,
                    child: Text(
                      startDate,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: CustomColors.SECONDARY,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
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
                    'End date :',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: CustomColors.SECONDARY,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: Text(
                      endDate,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: CustomColors.SECONDARY,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                createdDateAndTime,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: CustomColors.SECONDARY,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TaskStatusDropdown(
                status: status,
                keyId: keyId,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.edit,
                    color: CustomColors.PRIMARY,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: const Icon(
                      Icons.delete,
                      color: CustomColors.ERROR,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Do you want to delete this todo?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<ChangeTaskStatusPageBloc>(context).add(
                  DeleteTodoEvent(
                    keyId: keyId,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
