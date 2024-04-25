import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todo/core/routing/app_router.dart';
import 'package:todo/core/widgets/app_blur.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_state.dart';
import 'package:todo/features/home/ui/widgets/add_todo_button.dart';
import 'package:todo/features/home/ui/widgets/choose_color_list_view.dart';
import 'package:todo/features/home/ui/widgets/write_todo_text_form_field.dart';

class BottomSheetItem extends StatelessWidget {
  final String textTodo;
  final bool editTodo;
  final int index;

  const BottomSheetItem({
    super.key,
    required this.textTodo,
    required this.editTodo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return multiBlocProvider(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(10.h),
            BlocBuilder<WriteTodoCubit, WriteTodoState>(
              builder: (context, state) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: AppBlur(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      height: 485.h,
                      decoration: BoxDecoration(
                        color: Color(context.read<WriteTodoCubit>().colorCode),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          WriteTodoTextFormField(
                            textTodo: textTodo,
                          ),
                          Gap(15.h),
                          const Spacer(),
                          const ChooseColorListView(),
                          Gap(15.h),
                          AddTodoButton(
                            editTodo: editTodo,
                            index: index,
                          ),
                          Gap(15.h),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
