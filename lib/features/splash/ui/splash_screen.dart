import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/core/theming/colors.dart';
import 'package:todo/features/splash/ui/widgets/background_image.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: ColorsManager.primaryBlue,
      body: const BackgroundImage(),
    );
  }
}
