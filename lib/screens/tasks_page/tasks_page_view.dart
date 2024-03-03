import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/models/todo.dart';
import '../../themes/custom_colors.dart';
import '../../widgets/task_details.dart';
import 'package:todo/screens/tasks_page/tasks_page_bloc.dart';
import 'package:todo/screens/tasks_page/tasks_page_state.dart';

class TasksPageView extends StatefulWidget {
  const TasksPageView({Key? key}) : super(key: key);

  @override
  _TasksPageViewState createState() => _TasksPageViewState();
}

class _TasksPageViewState extends State<TasksPageView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130.0),
          child: AppBar(
            leading: Container(),
            title: Text(
              'My Tasks Status',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: CustomColors.SURFACED,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            centerTitle: true,
            bottom: TabBar(
              indicator: BoxDecoration(
                color: CustomColors.PRIMARY,
                borderRadius: BorderRadius.circular(20.0),
              ),
              labelColor: Colors.white,
              unselectedLabelStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: CustomColors.PRIMARY,
              indicatorPadding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              tabs: const [
                Tab(text: 'All Tasks'),
                Tab(text: 'Todo'),
                Tab(text: 'In Progress'),
                Tab(text: 'Done'),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            TaskList(type: 'all'),
            TaskList(type: 'todo'),
            TaskList(type: 'In Progress'),
            TaskList(type: 'done'),
          ],
        ),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final String type;

  const TaskList({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TasksPageBloc tasksBloc = BlocProvider.of<TasksPageBloc>(context);

    return BlocBuilder<TasksPageBloc, TasksPageState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: CustomColors.PRIMARY,
            ),
          );
        }
        if (type == 'todo') {
          List<Todo> todoStatusList =
              state.todos.where((todo) => todo.status == 'todo').toList();
          return ListView.builder(
            itemCount: todoStatusList.length,
            itemBuilder: (context, index) {
              return TaskDetails(
                title: todoStatusList[index].title,
                description: todoStatusList[index].description,
                startDate: todoStatusList[index].startDate,
                endDate: todoStatusList[index].endDate,
                type: todoStatusList[index].category,
              );
            },
          );
        }
        if (type == 'done') {
          List<Todo> todoStatusList =
              state.todos.where((todo) => todo.status == 'done').toList();
          return ListView.builder(
            itemCount: todoStatusList.length,
            itemBuilder: (context, index) {
              return TaskDetails(
                title: todoStatusList[index].title,
                description: todoStatusList[index].description,
                startDate: todoStatusList[index].startDate,
                endDate: todoStatusList[index].endDate,
                type: todoStatusList[index].category,
              );
            },
          );
        }

        if (type == 'In Progress') {
          List<Todo> todoStatusList = state.todos
              .where((todo) => todo.status == 'In Progress')
              .toList();
          return ListView.builder(
            itemCount: todoStatusList.length,
            itemBuilder: (context, index) {
              return TaskDetails(
                title: todoStatusList[index].title,
                description: todoStatusList[index].description,
                startDate: todoStatusList[index].startDate,
                endDate: todoStatusList[index].endDate,
                type: todoStatusList[index].category,
              );
            },
          );
        }
        return ListView.builder(
          itemCount: state.todos.length,
          itemBuilder: (context, index) {
            return TaskDetails(
              title: state.todos[index].title,
              description: state.todos[index].description,
              startDate: state.todos[index].startDate,
              endDate: state.todos[index].endDate,
              type: state.todos[index].category,
            );
          },
        );
      },
    );
  }
}
