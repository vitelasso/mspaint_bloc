import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mspaint_bloc/app_bloc_observer.dart';
import 'package:mspaint_bloc/app_router.dart';
import 'package:mspaint_bloc/app_router.gr.dart';
import 'package:mspaint_bloc/bloc/painter/painter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MS Paint Code Task',
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: ThemeData(primaryColor: Colors.blue),
      builder: (context, router) => router!,
    );
  }
}
