import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/features/home/ui/widgets/bloc_builder_list_view_todos.dart';
import 'package:todo/features/home/ui/widgets/floating_action_button_new_todo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return  const Scaffold(
      body: SafeArea(
        child: BlocBuilderListViewTodos(),
      ),
      floatingActionButton: FloatingActionButtonNewTodo( ),

    );
  }
}
