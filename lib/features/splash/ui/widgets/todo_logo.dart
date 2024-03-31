import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodoLogo extends StatelessWidget {
  const TodoLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svgs/todo_logo_splash.svg',
      height: 135.h,
    );
  }
}
