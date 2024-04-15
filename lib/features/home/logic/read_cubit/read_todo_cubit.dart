import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/core/helper/hive_constants.dart';
import 'package:todo/features/home/data/model/todo_model.dart';
import 'package:todo/features/home/logic/read_cubit/read_todo_state.dart';

class ReadTodoCubit extends Cubit<ReadTodoState> {
  final Box _box = Hive.box(HiveConstants.todoBox);

  ReadTodoCubit() : super(const ReadTodoState.initial());

  void getTodos() {
    emit(const ReadTodoState.loadingReadTodo());
    try {
      List<TodoModel> todos =
          List.from(_box.get(HiveConstants.todoList, defaultValue: []))
              .cast<TodoModel>();
      emit(ReadTodoState.successReadTodo(todos: todos));
    } catch (failure) {
      emit(ReadTodoState.failureReadTodo(
          messageError: 'getTodoMessageError:${failure.toString()}'));
    }
  }
}
