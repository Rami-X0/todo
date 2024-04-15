import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/core/widgets/app_loading.dart';
import 'package:todo/features/home/data/model/todo_model.dart';
import 'package:todo/features/home/logic/read_cubit/read_todo_cubit.dart';
import 'package:todo/features/home/logic/read_cubit/read_todo_state.dart';
import 'package:todo/features/home/ui/widgets/todo_view_items.dart';

class BlocBuilderListViewTodos extends StatelessWidget {
  const BlocBuilderListViewTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadTodoCubit, ReadTodoState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loadingReadTodo: () => const AppLoading(),
          successReadTodo: (todo) => _listViewTodos(todo),
          failureReadTodo: (errorMessage) => _failureReadTodo(),
        );
      },
    );
  }

  Widget _listViewTodos(List<TodoModel> todo) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return TodoViewItems(
            index: index,
            todoModel: todo[index],
          );
        },
        separatorBuilder: (context, index) {
          return _dividerSpace();
        },
        itemCount: todo.length,
      ),
    );
  }

  Widget _dividerSpace() {
    return Divider(
      color: ColorsManager.darkBlue,
      indent: 5.w,
      endIndent: 5.w,
      thickness: 0.9.h,
    );
  }

  Widget _failureReadTodo() {
    return const Text('error get data');
  }
}
