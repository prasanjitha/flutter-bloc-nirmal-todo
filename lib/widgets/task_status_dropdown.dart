import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes/custom_colors.dart';
import '../screens/change_task_status_page/change_task_status_page_bloc.dart';
import '../screens/change_task_status_page/change_task_status_page_event.dart';

class TaskStatusDropdown extends StatefulWidget {
  final String status;
  final String keyId;

  const TaskStatusDropdown({
    super.key,
    required this.status,
    required this.keyId,
  });
  @override
  _TaskStatusDropdownState createState() => _TaskStatusDropdownState();
}

class _TaskStatusDropdownState extends State<TaskStatusDropdown> {
  late String selectedStatus = widget.status;
  List<String> statusOptions = ['todo', 'In Progress', 'done'];

  @override
  Widget build(BuildContext context) {
    ChangeTaskStatusPageBloc addTodoBloc =
        BlocProvider.of<ChangeTaskStatusPageBloc>(context);
    return DropdownButton<String>(
      value: selectedStatus,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: CustomColors.PRIMARY, fontSize: 16.0),
      onChanged: (String? newValue) {
        setState(() {
          selectedStatus = newValue!;
          addTodoBloc.add(
            UpdateStateEvent(
              status: selectedStatus,
              keyId: widget.keyId,
            ),
          );
        });
      },
      items: statusOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
