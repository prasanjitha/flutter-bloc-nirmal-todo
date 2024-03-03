import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/todo.dart';
import 'tasks_page_event.dart';
import 'tasks_page_state.dart';

class TasksPageBloc extends Bloc<TasksPageEvent, TasksPageState> {
  TasksPageBloc(BuildContext context) : super(TasksPageState.initialState) {
    on<InitEvent>((event, emit) async {
      emit(state.clone(isLoading: true));
      try {
        var url = "https://todo-b681b-default-rtdb.firebaseio.com/todo.json";
        var response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);
          List<Todo> todos = [];
          data.forEach((key, value) {
            Todo todo = Todo.fromJson(value);
            todo.id = key;
            todos.add(todo);
          });
          emit(state.clone(isLoading: false, todos: todos));
        }
      } catch (e) {
        emit(state.clone(isLoading: false));

        return Future.error('error');
      }
    });
    add(InitEvent());
  }
}
