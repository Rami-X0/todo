import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todo/core/theming/styles.dart';
import 'package:todo/features/home/data/model/todo_model.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_state.dart';
import 'package:todo/features/home/ui/widgets/delete_todo.dart';

class TodoViewItems extends StatelessWidget {
  final int index;
  final TodoModel todoModel;

  const TodoViewItems(
      {super.key, required this.index, required this.todoModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteTodoCubit, WriteTodoState>(
      builder: (context, state) {
        return DeleteTodo(
          index: index,
          todoModel: todoModel,
          child: Container(
            width: 370.w,
            height: 80.h,
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(todoModel.colorCode),
            ),
            child: _showTextTodo(todoModel),
          ),
        );
      },
    );
  }



  Widget _showTextTodo(TodoModel todoModel) {
    return Row(
      children: [
        Text(
          '${todoModel.itemIndex + 1} :',
          style: TextStyles.font18secondaryColorBold,
        ),
        Gap(10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todoModel.text.toString(),
                style: TextStyles.font20WhiteBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Gap(10.h),
              Text(
                todoModel.date,
                style: TextStyles.font20WhiteBold.copyWith(
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
