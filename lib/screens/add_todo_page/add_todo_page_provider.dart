import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_todo_page_bloc.dart';
import 'add_todo_page_view.dart';

class AddTodoPageProvider extends BlocProvider<AddTodoPageBloc> {
  AddTodoPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => AddTodoPageBloc(context),
          child: const AddTodoPageView(),
        );
}
