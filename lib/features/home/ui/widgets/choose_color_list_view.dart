import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_state.dart';
import 'package:todo/features/home/ui/widgets/choose_color_item.dart';

class ChooseColorListView extends StatelessWidget {
  const ChooseColorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteTodoCubit, WriteTodoState>(
  builder: (context, state) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: context.read<WriteTodoCubit>().colors.length,
        itemBuilder: (context, index) {
          return ChooseColorItem(
            index: index,
            isSelectedColor: context.read<WriteTodoCubit>().colorCode,
          );
        },
      ),
    );
  },
);
  }
}
