import 'package:flutter/material.dart';

extension NavigatorHelper on BuildContext {
  Future<void> pushNamed(String name) {
   return  Navigator.pushNamed(this, name);
  }

  void pushNamedAndRemoveUntil(String name) {
    Navigator.pushNamedAndRemoveUntil(this, name, (route) => false);
  }

Future  <void> pop() async {
    Navigator.pop(this);
  }
}
