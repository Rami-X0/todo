import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/core/helper/hive_constants.dart';
import 'package:todo/features/home/data/model/todo_model.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_state.dart';

class WriteTodoCubit extends Cubit<WriteTodoState> {
  final Box _box = Hive.box(HiveConstants.todoBox);
  int colorCode = 0xff526D82;
  String text = '';
  final TextEditingController todoController = TextEditingController();

  WriteTodoCubit() : super(const WriteTodoState.initial());

  void updateText(String text) {
    this.text = text;
    emit(const WriteTodoState.updateTextWriteTodo());
  }

  void updateColorCode(int colorCode) {
    this.colorCode = colorCode;
    emit(WriteTodoState.updateColorCodeWriteTodo(colorCode: colorCode));
  }

  void addPutTodo(int indexDb) {
    _writeTryCatch(() {
      List<TodoModel> todos = _getTodosFromDb();
      todos[indexDb] = todos[indexDb].addTodo(text);
      putTodos(todos);
    }, 'addPutTodo');
  }

  void deletePutTodo(int indexDb) {
    _writeTryCatch(() {
      List<TodoModel> todos = _getTodosFromDb();
      todos[indexDb] = todos[indexDb].deleteTodo(indexDb);
      putTodos(todos);
    }, 'deletePutTodo');
  }

  void addTodoInDB() {
    _writeTryCatch(() {
      List<TodoModel> todos = _getTodosFromDb();
      todos.add(
          TodoModel(itemIndex: todos.length, colorCode: colorCode, text: text));
      putTodos(todos);
    }, 'addTodoInDB');
  }

  void deleteTodoInDB(int indexDb) {
    _writeTryCatch(() {
      List<TodoModel> todos = _getTodosFromDb();
      todos.removeAt(indexDb);
      for (var i = indexDb; i < todos.length; i++) {
        todos[i] = todos[i].decrementIndex();
        putTodos(todos);
      }
    }, 'deleteTodoInDB');
  }

  void putTodos(List<TodoModel> todos) {
    _box.put(HiveConstants.todoList, todos);
  }

  List<TodoModel> _getTodosFromDb() {
    return List.from(_box.get(HiveConstants.todoList, defaultValue: []))
        .cast<TodoModel>();
  }

  void _writeTryCatch(VoidCallback action, String errorMessage) {
    emit(const WriteTodoState.loadingWriteTodo());
    try {
      action.call();
      emit(const WriteTodoState.successWriteTodo());
    } catch (failure) {
      emit(WriteTodoState.failureWriteTodo(
          messageError: '$errorMessage:${failure.toString()}'));
    }
  }

  final List<int> colors = const [
    0xff526D82,
    0xff1F6E8C,
    0xff556E53,
    0xff50727B,
    0xff5C8374,
    0xffA76F6F,
    0xff6D5D6E,
    0xff635985,
    0xff50577A,
    0xff3F4E4F,
    0xff3C6562,
    0xff7D5E53,
    0xff19376D,
    0xff395B64,
    0xff31363F,
  ];
}
