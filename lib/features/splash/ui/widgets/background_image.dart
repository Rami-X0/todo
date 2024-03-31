import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/theming/colors.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      decoration: BoxDecoration(

        color: ColorsManager.primaryBlue,
        image: DecorationImage(
          image: AssetImage('assets/images/background_splash.png',),
        fit: BoxFit.cover
        ),
      ),
    );
  }
}
