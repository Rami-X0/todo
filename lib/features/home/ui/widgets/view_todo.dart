import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todo/core/routing/app_router.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/core/theming/styles.dart';
import 'package:todo/core/widgets/app_blur.dart';
import 'package:todo/features/home/data/model/todo_model.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_state.dart';

class ViewTodo extends StatelessWidget {
  final TodoModel todoModel;

  const ViewTodo({
    super.key,
    required this.todoModel,
  });

  @override
  Widget build(BuildContext context) {
    return multiBlocProvider(
      child: BlocBuilder<WriteTodoCubit, WriteTodoState>(
        builder: (context, state) {
          return AppBlur(
            child: Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(15.w),
              child: _boxShowTodo(todoModel, context),
            ),
          );
        },
      ),
    );
  }

  Widget _boxShowTodo(TodoModel todoModel, BuildContext context) {
    return Container(
      width: 500.w,
      height: 500.h,
      decoration: BoxDecoration(
        color: Color(todoModel.colorCode),
        borderRadius: BorderRadius.circular(15),
      ),
      child: _showTodo(todoModel, context),
    );
  }

  Widget _closeIcon(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          maxRadius: 30.h,
          backgroundColor: ColorsManager.secondaryColor,
          child: CloseButton(
            color: ColorsManager.white,
          ),
        ),
        Gap(8.h),
      ],
    );
  }

  Widget _showTodo(TodoModel todoModel, BuildContext context) {
    return Column(
      children: [
        Gap(15.h),
        _closeIcon(context),
        Divider(
          indent: 10.w,
          endIndent: 10.w,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(2.h),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SelectableText(
                      todoModel.text,
                      style: TextStyles.font20WhiteBold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
