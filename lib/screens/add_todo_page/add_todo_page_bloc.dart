import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:todo/config/config.dart';
import 'add_todo_page_event.dart';
import 'add_todo_page_state.dart';

class AddTodoPageBloc extends Bloc<AddTodoPageEvent, AddTodoPageState> {
  AddTodoPageBloc(BuildContext context) : super(AddTodoPageState.initialState) {
    on<AddTodoEvent>((event, emit) async {
      emit(state.clone(isLoading: true));
      try {
        DateTime now = DateTime.now();
        String formattedDateTime = formatDate(now);
        var todoData = {
          'id': generateRandomId(),
          'category': event.category,
          'title': event.title,
          'description': event.description,
          'startDate': event.startDate,
          'endDate': event.endDate,
          'status': 'todo',
          'postedDateAndTime': formattedDateTime,
        };
        var url = "https://todo-b681b-default-rtdb.firebaseio.com/todo.json";
        await http
            .post(Uri.parse(url), body: jsonEncode(todoData))
            .then((response) {});
      } catch (e) {
        return Future.error('error');
      }

      emit(state.clone(isLoading: false));
    });
  }
}
