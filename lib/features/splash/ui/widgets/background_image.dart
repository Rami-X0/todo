import 'package:flutter/material.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/features/splash/ui/widgets/scale_fade_align_todo_and_text.dart';
import 'package:todo/features/splash/ui/widgets/todo_logo.dart';
import 'package:todo/features/splash/ui/widgets/todo_text.dart';

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
                  'assets/images/background_splash.png',
                ),
                fit: BoxFit.cover,),
          ),
        ),
        const ScaleFadeAlignTodoAndText(
          begin: Alignment.topCenter,
          end: Alignment.center,
          child: TodoLogo(),
        ),
        const ScaleFadeAlignTodoAndText(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          child: TodoText(),
        ),
      ],
    );
  }
}
