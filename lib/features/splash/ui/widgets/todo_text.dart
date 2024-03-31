import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todo/core/theming/styles.dart';

class TodoText extends StatelessWidget {
  const TodoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(230.h),
        Text(
          'ToDo',
          style: TextStyles.font38WhiteBold,
        ),
      ],
    );
  }
}
