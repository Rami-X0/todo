import 'package:hive_flutter/hive_flutter.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  final int itemIndex;
  @HiveField(1)
  final int colorCode;
  @HiveField(2)
  final List<String> textTodo;
  @HiveField(3)
  final String text;
  @HiveField(4)
  final String date;

  TodoModel({
    required this.itemIndex,
    required this.colorCode,
    required this.text,
    required this.date,
    this.textTodo = const [],
  });

  TodoModel addTodo(String todo) {
    List<String> newTodo = List.from(textTodo);
    newTodo.add(todo);
    return _initializeTodo(newTodo);
  }

  TodoModel deleteTodo(int index) {
    List<String> deleteTodo = List.from(textTodo);
    deleteTodo.removeAt(index);
    return _initializeTodo(deleteTodo);
  }

  TodoModel decrementIndex() {
    return TodoModel(
      itemIndex: itemIndex - 1,
      colorCode: colorCode,
      text: text,
      date: date,
      textTodo: textTodo,
    );
  }

  TodoModel _initializeTodo(List<String> todo) {
    return TodoModel(
      itemIndex: itemIndex,
      colorCode: colorCode,
      date: date,
      text: text,
      textTodo: todo,
    );
  }
}
