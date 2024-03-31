import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/features/splash/ui/widgets/todo_logo.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.primaryBlue,
            image: const DecorationImage(
                image: AssetImage(
                  'assets/images/background_native_splash.png',
                ),
                fit: BoxFit.cover),
          ),
        ),
      TodoLogo()
      ],
    );
  }
}
