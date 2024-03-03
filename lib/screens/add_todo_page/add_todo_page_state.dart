import 'package:flutter/foundation.dart';

@immutable
class AddTodoPageState {
  final String error;
  final List<Map<String, dynamic>> myTodos;
  final bool isLoading;

  const AddTodoPageState({
    required this.error,
    required this.myTodos,
    required this.isLoading,
  });

  static AddTodoPageState get initialState {
    return const AddTodoPageState(error: 'jjj', myTodos: [], isLoading: false);
  }

  AddTodoPageState clone({
    String? error,
    List<Map<String, dynamic>>? myTodos,
    bool? isLoading,
  }) {
    return AddTodoPageState(
      error: error ?? this.error,
      myTodos: myTodos ?? this.myTodos,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
