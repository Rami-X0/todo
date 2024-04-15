import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/routing/routes.dart';
import 'package:todo/core/theming/todo_theme.dart';
import 'package:todo/features/splash/ui/splash_screen.dart';
import 'package:todo/core/routing/app_router.dart' as routes;

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: routes.generateRoute,
        theme:TodoTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
