import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';
import 'package:todo/features/home/ui/widgets/bottom_sheet_item.dart';

class FloatingActionButtonNewTodo extends StatelessWidget {
  const FloatingActionButtonNewTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorsManager.primaryColor,
      splashColor: ColorsManager.white,
      onPressed: () {
        _actionThenTapFloatingButton(context);
      },
      child: FaIcon(
        FontAwesomeIcons.pen,
        color: ColorsManager.secondaryColor,
      ),
    );
  }

  void _actionThenTapFloatingButton(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const BottomSheetItem();
      },
    ).whenComplete(
      () => context.read<WriteTodoCubit>().todoController.clear(),
    );
  }
}
