import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';

class ChooseColorItem extends StatelessWidget {
  final int index;
  final int isSelectedColor;

  const ChooseColorItem(
      {super.key, required this.index, required this.isSelectedColor});

  @override
  Widget build(BuildContext context) {
    var colors = context.read<WriteTodoCubit>().colors[index];
    return GestureDetector(
      onTap: () => _actionThenTapColorItem(context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 550),
        width: 35.w,
        margin: EdgeInsets.symmetric(horizontal: 2.5.w),
        decoration: BoxDecoration(
          color: Color(colors),
          shape: BoxShape.circle,
          border: isSelectedColor == colors
              ? Border.all(
                  color: ColorsManager.secondaryColor,
                  width: 1.5,
                )
              : null,
        ),
        child: _selectIconColor(context),
      ),
    );
  }

  Center _selectIconColor(BuildContext context) {
    var colors = context.read<WriteTodoCubit>().colors[index];
    return Center(
      child: isSelectedColor == colors
          ? FaIcon(
              FontAwesomeIcons.check,
              color: ColorsManager.secondaryColor,
              size: 15.w,
            )
          : null,
    );
  }

  _actionThenTapColorItem(BuildContext context) {
    var colors = context.read<WriteTodoCubit>().colors[index];
    context.read<WriteTodoCubit>().updateColorCode(colors);
  }
}
