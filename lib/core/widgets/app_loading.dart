import 'package:flutter/material.dart';
import 'package:todo/core/theming/colors.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorsManager.darkBlue,
      ),
    );
  }
}
