import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/helper/extension.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/core/theming/styles.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_state.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteTodoCubit, WriteTodoState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            onTapAddTodo(context);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            width: 200,
            height: 85.h,
            decoration: BoxDecoration(
              color: Color(context.read<WriteTodoCubit>().colorCode),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: ColorsManager.secondaryColor,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Center(
                child: Text(
              'save',
              style: TextStyles.font18secondaryColorBold,
            )),
          ),
        );
      },
    );
  }

  void onTapAddTodo(BuildContext context) {
    final writeCubit = context.read<WriteTodoCubit>();
    if (writeCubit.formKey.currentState!.validate()) {
      updateDate(context);
      writeCubit.addTodoInDB();
      context.pop();
    }
  }

  void updateDate(BuildContext context) {
    final writeCubit = context.read<WriteTodoCubit>();
    DateTime dateTime = DateTime.now();
    String date = DateFormat("yyyy-MM-dd").format(dateTime);
    writeCubit.updateDateTime(date.toString());
  }
}
