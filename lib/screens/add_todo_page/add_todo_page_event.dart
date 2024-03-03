import 'package:flutter/foundation.dart';

@immutable
abstract class AddTodoPageEvent {}

class AddTodoEvent extends AddTodoPageEvent {
  final String category;
  final String title;
  final String description;
  final String startDate;
  final String endDate;

  AddTodoEvent({
    required this.category,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
  });
}
