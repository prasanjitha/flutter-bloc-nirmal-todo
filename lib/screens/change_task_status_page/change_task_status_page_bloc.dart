import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/todo.dart';
import 'change_task_status_page_event.dart';
import 'change_task_status_page_state.dart';

class ChangeTaskStatusPageBloc
    extends Bloc<ChangeTaskStatusPageEvent, ChangeTaskStatusPageState> {
  ChangeTaskStatusPageBloc(BuildContext context)
      : super(ChangeTaskStatusPageState.initialState) {
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
    on<UpdateStateEvent>((event, emit) async {
      emit(state.clone(isLoading: true));
      var updateData = {
        'status': event.status,
      };
      var taskId = event.keyId;
      var updateUrl =
          "https://todo-b681b-default-rtdb.firebaseio.com/todo/$taskId.json";
      await http
          .patch(Uri.parse(updateUrl), body: jsonEncode(updateData))
          .then((updateResponse) {
        if (updateResponse.statusCode == 200) {
          emit(state.clone(isLoading: false));
        } else {
          emit(state.clone(isLoading: false));
        }
      }).catchError((e) {
        return Future.error('error');
      });
    });

    on<DeleteTodoEvent>((event, emit) async {
      try {
        emit(state.clone(isLoading: true));
        var taskId = event.keyId;
        var deleteUrl =
            "https://todo-b681b-default-rtdb.firebaseio.com/todo/$taskId.json";

        await http.delete(Uri.parse(deleteUrl));

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
  }
}
