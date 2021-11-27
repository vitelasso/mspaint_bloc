import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mspaint_bloc/bloc/painter/painter_bloc.dart';
import 'package:mspaint_bloc/screens/board_screen.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PainterBloc(),
      child: const BoardScreen(),
    );
  }
}
