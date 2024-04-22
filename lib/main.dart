import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/core/helper/bloc_observer.dart';
import 'package:todo/core/helper/hive_constants.dart';
import 'package:todo/features/home/data/model/todo_model.dart';
import 'package:todo/todo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox(HiveConstants.todoBox);
  Bloc.observer = MyBlocObserver();
//await ScreenUtil.ensureScreenSize();
  runApp(const TodoApp());
}
