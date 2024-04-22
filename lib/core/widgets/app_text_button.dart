import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/core/theming/styles.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
          ),
          overlayColor:
              MaterialStateProperty.all(ColorsManager.white.withOpacity(0.2)),
          fixedSize: MaterialStateProperty.all(
            Size(70.w, 15.h),
          ),
        ),

        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.font10darkBlueBold.copyWith(
            fontSize: 14.sp,
          color: textColor
          ),
        ));
  }
}
