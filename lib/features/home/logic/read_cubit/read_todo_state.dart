import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/features/home/data/model/todo_model.dart';

part 'read_todo_state.freezed.dart';

@freezed
class ReadTodoState with _$ReadTodoState {
  const factory ReadTodoState.initial() = Initial;

  const factory ReadTodoState.loadingReadTodo() = LoadingReadTodo;

  const factory ReadTodoState.successReadTodo(
      {required List<TodoModel> todos}) = SuccessReadTodo;

  const factory ReadTodoState.failureReadTodo({required String messageError}) =
      FailureReadTodo;


}
