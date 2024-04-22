import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/routing/routes.dart';
import 'package:todo/features/home/logic/read_cubit/read_todo_cubit.dart';
import 'package:todo/features/home/logic/write_cubit/write_todo_cubit.dart';
import 'package:todo/features/home/ui/home_screen.dart';
import 'package:todo/features/splash/ui/splash_screen.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case Routes.homeScreen:
      return MaterialPageRoute(
        builder: (_) => multiBlocProvider(child: const HomeScreen()),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

Widget multiBlocProvider({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<WriteTodoCubit>(create:(context)=> WriteTodoCubit()),
      BlocProvider<ReadTodoCubit>(create:(context)=> ReadTodoCubit()..getTodos()),

    ],
    child: child,
  );
}
