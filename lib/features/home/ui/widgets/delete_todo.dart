import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/core/theming/styles.dart';
import 'package:todo/core/widgets/app_blur.dart';
import 'package:todo/core/widgets/app_text_button.dart';
import 'package:todo/features/home/data/model/todo_model.dart';
import 'package:todo/features/home/logic/read_cubit/read_todo_cubit.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';

class DeleteTodo extends StatelessWidget {
  final int index;
  final TodoModel todoModel;
  final Widget child;
  final int duration = 400;

  const DeleteTodo({
    super.key,
    required this.index,
    required this.todoModel,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      movementDuration: Duration(milliseconds: duration),
      resizeDuration: Duration(milliseconds: duration),
      key: UniqueKey(),
      background: backgroundDismissible(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => _onDismissed(context),
      confirmDismiss: (direction) => _confirmDismiss(direction, context),
      child: child,
    );
  }

  Future<bool> _confirmDismiss(
      DismissDirection direction, BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AppBlur(
        child: AlertDialog(
          backgroundColor: ColorsManager.white,
          title: Text(
            "Are you sure?",
            style: TextStyles.font10darkBlueBold.copyWith(fontSize: 18.sp),
          ),
          actions: [
            AppTextButton(
              onPressed: () => Navigator.of(context).pop(false),
              text: 'Cancel',
            ),
            AppTextButton(
              onPressed: () => Navigator.of(context).pop(true),
              text: 'Delete',
            ),
          ],
        ),
      ),
    );
  }

  void _onDismissed(BuildContext context) {
    context.read<WriteTodoCubit>().deleteTodoInDB(index);
    context.read<ReadTodoCubit>().getTodos();
  }

  Widget backgroundDismissible() {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FaIcon(
              FontAwesomeIcons.trash,
              color: Colors.white,
              size: 22.w,
            ),
            SizedBox(width: 8.w),
            Text(
              'Delete',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
