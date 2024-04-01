import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/features/home/data/model/todo_model.dart';

part'write_todo_state.freezed.dart';
@freezed
 class WriteTodoState with _$WriteTodoState {
  const factory WriteTodoState.initial() = Initial;

  const factory WriteTodoState.loadingWriteTodo() = LoadingWriteTodo;

  const factory WriteTodoState.successWriteTodo() =
      SuccessWriteTodo;

  const factory WriteTodoState.failureWriteTodo(
      {required String messageError}) = FailureWriteTodo;

  const factory WriteTodoState.updateTextWriteTodo() = UpdateTextWriteTodo;
  const factory WriteTodoState.updateColorCodeWriteTodo() = UpdateColorCodeWriteTodo;

}
