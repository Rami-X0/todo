import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font38WhiteBold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeightHelper.bold,
    fontSize: 38.sp,
  );
  static TextStyle font18secondaryColorBold = TextStyle(
      fontSize: 18.sp,
      color: ColorsManager.secondaryColor,
      fontWeight: FontWeightHelper.bold);
  static TextStyle font20WhiteBold = TextStyle(
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.bold,
    fontSize: 20.sp,
  );
static TextStyle font10darkBlueBold = TextStyle(
    color: ColorsManager.darkBlue,
    fontWeight: FontWeightHelper.bold,
    fontSize: 10.sp,
  );
}
