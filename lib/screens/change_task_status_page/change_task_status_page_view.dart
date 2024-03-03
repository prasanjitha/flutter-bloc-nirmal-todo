import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/todo.dart';
import '../../themes/custom_colors.dart';
import '../../widgets/custom_appbar.dart';
import 'change_task_status_page_bloc.dart';
import '../../widgets/todo_item_container.dart';
import 'package:todo/screens/change_task_status_page/change_task_status_page_state.dart';

class ChangeTaskStatusPageView extends StatefulWidget {
  final String appBarTitle;
  const ChangeTaskStatusPageView({
    Key? key,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  _ChangeTaskStatusPageViewState createState() =>
      _ChangeTaskStatusPageViewState();
}

class _ChangeTaskStatusPageViewState extends State<ChangeTaskStatusPageView> {
  @override
  Widget build(BuildContext context) {
    ChangeTaskStatusPageBloc addTodoBloc =
        BlocProvider.of<ChangeTaskStatusPageBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/add_task_bg.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CutomAppBar(
                    appBarTitle: widget.appBarTitle,
                  ),
                  BlocBuilder<ChangeTaskStatusPageBloc,
                      ChangeTaskStatusPageState>(
                    buildWhen: (previous, current) =>
                        previous.isLoading != current.isLoading,
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: CustomColors.PRIMARY,
                          ),
                        );
                      }
                      if (widget.appBarTitle == "Office Tasks") {
                        List<Todo> todoStatusList = state.todos
                            .where((todo) => todo.category == 'Office taks')
                            .toList();

                        return SizedBox(
                            height: MediaQuery.of(context).size.height - 200,
                            child: ListView.builder(
                              itemCount: todoStatusList.length,
                              itemBuilder: (context, index) {
                                if (state.todos.isEmpty) {
                                  return const Center(
                                    child: Text('No task available',
                                        style: TextStyle(
                                          color: CustomColors.SURFACED,
                                          fontSize: 16.0,
                                        )),
                                  );
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 20.0,
                                  ),
                                  child: TodoItemContainer(
                                    title: todoStatusList[index].title,
                                    description:
                                        todoStatusList[index].description,
                                    createdDateAndTime:
                                        todoStatusList[index].postedDateAndTime,
                                    startDate: todoStatusList[index].startDate,
                                    endDate: todoStatusList[index].endDate,
                                    status: todoStatusList[index].status,
                                    keyId: todoStatusList[index].id,
                                  ),
                                );
                              },
                            ));
                      }
                      if (widget.appBarTitle == "Personal Tasks") {
                        List<Todo> todoStatusList = state.todos
                            .where((todo) => todo.category == 'Personal task')
                            .toList();

                        return SizedBox(
                            height: MediaQuery.of(context).size.height - 200,
                            child: ListView.builder(
                              itemCount: todoStatusList.length,
                              itemBuilder: (context, index) {
                                if (state.todos.isEmpty) {
                                  return const Center(
                                    child: Text('No task available',
                                        style: TextStyle(
                                          color: CustomColors.SURFACED,
                                          fontSize: 16.0,
                                        )),
                                  );
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 20.0,
                                  ),
                                  child: TodoItemContainer(
                                    title: todoStatusList[index].title,
                                    description:
                                        todoStatusList[index].description,
                                    createdDateAndTime:
                                        todoStatusList[index].postedDateAndTime,
                                    startDate: todoStatusList[index].startDate,
                                    endDate: todoStatusList[index].endDate,
                                    status: todoStatusList[index].status,
                                    keyId: todoStatusList[index].id,
                                  ),
                                );
                              },
                            ));
                      }
                      if (widget.appBarTitle == "Other Tasks") {
                        List<Todo> todoStatusList = state.todos
                            .where((todo) => todo.category == 'Others')
                            .toList();

                        return SizedBox(
                            height: MediaQuery.of(context).size.height - 200,
                            child: ListView.builder(
                              itemCount: todoStatusList.length,
                              itemBuilder: (context, index) {
                                if (state.todos.isEmpty) {
                                  return const Center(
                                    child: Text('No task available',
                                        style: TextStyle(
                                          color: CustomColors.SURFACED,
                                          fontSize: 16.0,
                                        )),
                                  );
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 20.0,
                                  ),
                                  child: TodoItemContainer(
                                    title: todoStatusList[index].title,
                                    description:
                                        todoStatusList[index].description,
                                    createdDateAndTime:
                                        todoStatusList[index].postedDateAndTime,
                                    startDate: todoStatusList[index].startDate,
                                    endDate: todoStatusList[index].endDate,
                                    status: todoStatusList[index].status,
                                    keyId: todoStatusList[index].id,
                                  ),
                                );
                              },
                            ));
                      }
                      return const Center(
                        child: Text('No task available',
                            style: TextStyle(
                              color: CustomColors.SURFACED,
                              fontSize: 16.0,
                            )),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
