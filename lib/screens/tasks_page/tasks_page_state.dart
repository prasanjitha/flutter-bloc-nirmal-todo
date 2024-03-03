import 'package:flutter/foundation.dart';

import '../../models/todo.dart';

@immutable
class TasksPageState {
  final String error;
  final bool isLoading;
  final List<Todo> todos;

  const TasksPageState({
    required this.error,
    required this.isLoading,
    required this.todos,
  });

  static TasksPageState get initialState {
    return const TasksPageState(error: '', isLoading: false, todos: []);
  }

  TasksPageState clone({
    String? error,
    bool? isLoading,
    List<Todo>? todos,
  }) {
    return TasksPageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      todos: todos ?? this.todos,
    );
  }
}
