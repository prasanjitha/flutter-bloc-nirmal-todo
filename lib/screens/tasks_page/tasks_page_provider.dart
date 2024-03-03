import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tasks_page_bloc.dart';
import 'tasks_page_view.dart';

class TasksPageProvider extends BlocProvider<TasksPageBloc> {
  TasksPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => TasksPageBloc(context),
          child: const TasksPageView(),
        );
}
