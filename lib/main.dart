import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/themes/custom_themes.dart';
import 'package:todo/screens/on_board/start_page.dart';
import 'package:todo/screens/add_todo_page/add_todo_page_bloc.dart';
import 'package:todo/screens/change_task_status_page/change_task_status_page_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddTodoPageBloc(context),
        ),
        BlocProvider(
          create: (context) => ChangeTaskStatusPageBloc(context),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: CustomThemes.lightTheme(context),
        home: const StartScreen(),
      ),
    );
  }
}
