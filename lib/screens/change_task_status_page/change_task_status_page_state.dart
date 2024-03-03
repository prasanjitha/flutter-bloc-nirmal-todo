import 'package:flutter/foundation.dart';

import '../../models/todo.dart';

@immutable
class ChangeTaskStatusPageState {
  final String error;
  final bool isLoading;
  final List<Todo> todos;

  const ChangeTaskStatusPageState({
    required this.error,
    required this.todos,
    required this.isLoading,
  });

  static ChangeTaskStatusPageState get initialState {
    return const ChangeTaskStatusPageState(
        error: '', todos: [], isLoading: false);
  }

  ChangeTaskStatusPageState clone({
    String? error,
    List<Todo>? todos,
    bool? isLoading,
  }) {
    return ChangeTaskStatusPageState(
      error: error ?? this.error,
      todos: todos ?? this.todos,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
