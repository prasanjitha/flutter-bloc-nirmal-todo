import 'package:flutter/foundation.dart';

@immutable
abstract class ChangeTaskStatusPageEvent {}

class InitEvent extends ChangeTaskStatusPageEvent {}

class UpdateStateEvent extends ChangeTaskStatusPageEvent {
  final String status;
  final String keyId;

  UpdateStateEvent({
    required this.status,
    required this.keyId,
  });
}

class DeleteTodoEvent extends ChangeTaskStatusPageEvent {
  final String keyId;

  DeleteTodoEvent({
    required this.keyId,
  });
}
