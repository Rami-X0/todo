import 'package:flutter/material.dart';
import 'package:todo/features/home/ui/widgets/floating_action_button_new_todo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButtonNewTodo(),
    );
  }
}
