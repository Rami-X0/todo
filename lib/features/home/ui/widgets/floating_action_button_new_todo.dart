import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/features/home/data/model/todo_model.dart';
import 'package:todo/features/home/logic/read_cubit/read_todo_cubit.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';
import 'package:todo/features/home/ui/widgets/bottom_sheet_item.dart';

class FloatingActionButtonNewTodo extends StatelessWidget {
  final TodoModel? todoModel;

  const FloatingActionButtonNewTodo({
    super.key,
    this.todoModel,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorsManager.primaryColor,
      splashColor: ColorsManager.white,
      onPressed: () => actionThenTapFloatingButton(context),
      child: FaIcon(
        FontAwesomeIcons.pen,
        color: ColorsManager.secondaryColor,
      ),
    );
  }

  void actionThenTapFloatingButton(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true
      ,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BottomSheetItem(
          textTodo: todoModel?.text ?? '',
          editTodo: false,
          index: todoModel?.itemIndex ?? -1,
        );
      },
    ).whenComplete(() {
      thenAddTodo(context);
    });
  }

  void thenAddTodo(BuildContext context) {
    BlocProvider.of<ReadTodoCubit>(context).getTodos();
    context.read<WriteTodoCubit>().todoController.clear();
  }
}
