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

  TodoModel({
    required this.itemIndex,
    required this.colorCode,
    required this.textTodo,
  });

  TodoModel addTodo(String todo) {
    final List<String> newTodo = List.from(textTodo);
    newTodo.add(todo);
    return _initializeTodo(newTodo);
  }

  TodoModel deleteTodo(int index) {
    final List<String> deleteTodo = List.from(textTodo);
    deleteTodo.removeAt(index);
    return _initializeTodo(deleteTodo);
  }

  TodoModel decrementIndex() {
    return TodoModel(
      itemIndex: itemIndex - 1,
      colorCode: colorCode,
      textTodo: textTodo,
    );
  }

  TodoModel _initializeTodo(List<String> todo) {
    return TodoModel(
      itemIndex: itemIndex,
      colorCode: colorCode,
      textTodo: todo,
    );
  }
}
