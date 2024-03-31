import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/core/helper/extension.dart';
import 'package:todo/core/routing/routes.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/features/splash/ui/widgets/background_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigationToThenAnimationSplash();
  }

  void navigationToThenAnimationSplash() {
    Future.delayed(const Duration(milliseconds: 1350), () {
      context.pushNamedAndRemoveUntil(Routes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorsManager.primaryBlue,
      body: const BackgroundImage(),
    );
  }
}
