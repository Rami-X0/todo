import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/widgets/app_text_button.dart';
import 'package:todo/features/home/data/model/todo_model.dart';
import 'package:todo/features/home/logic/read_cubit/read_todo_cubit.dart';
import 'package:todo/features/home/logic/read_cubit/read_todo_state.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';

import 'bottom_sheet_item.dart';

class EditTodo extends StatelessWidget {
  final TodoModel todoModel;

  const EditTodo({
    super.key,
    required this.todoModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadTodoCubit, ReadTodoState>(
      builder: (context, state) {
        return AppTextButton(
          textColor: Colors.white,
          text: 'edit',
          onPressed: () => actionThenTapFloatingButton(context),
        );
      },
    );
  }

  void actionThenTapFloatingButton(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BottomSheetItem(
          textTodo: todoModel.text,
          editTodo: true,
          index: todoModel.itemIndex,
        );
      },
    ).whenComplete(() {
      thenAddTodo(context);
    });
  }

  void thenAddTodo(BuildContext context) {
    context.read<ReadTodoCubit>().getTodos();
    context.read<WriteTodoCubit>().todoController.clear();
  }
}
