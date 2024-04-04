import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_state.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteTodoCubit, WriteTodoState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 750),
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
            child: const Center(child: Text('go')),
          ),
        );
      },
    );
  }
}
