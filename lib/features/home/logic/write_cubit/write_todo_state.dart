import 'package:freezed_annotation/freezed_annotation.dart';

part 'write_todo_state.freezed.dart';

@freezed
class WriteTodoState with _$WriteTodoState {
  const factory WriteTodoState.initial() = Initial;

  const factory WriteTodoState.loadingWriteTodo() = LoadingWriteTodo;

  const factory WriteTodoState.successWriteTodo() = SuccessWriteTodo;

  const factory WriteTodoState.failureWriteTodo(
      {required String messageError}) = FailureWriteTodo;

  const factory WriteTodoState.updateTextWriteTodo({required String text}) =
      UpdateTextWriteTodo;

  const factory WriteTodoState.updateColorCodeWriteTodo(
      {required int colorCode}) = UpdateColorCodeWriteTodo;

  const factory WriteTodoState.updateDateWriteTodo({required String date}) =
      UpdateDateWriteTodo;


}
