import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/core/theming/styles.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
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
         overlayColor: MaterialStateProperty.all(
           ColorsManager.darkBlue.withOpacity(0.2)
         ),

        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.font10darkBlueBold.copyWith(
            fontSize: 14.sp,
          ),
        ));
  }
}
