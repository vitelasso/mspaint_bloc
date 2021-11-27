import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mspaint_bloc/app_router.gr.dart';
import 'package:mspaint_bloc/bloc/painter/painter_bloc.dart';
import 'package:mspaint_bloc/bloc/painter/painter_event.dart';
import 'package:mspaint_bloc/widgets/menu_bar.dart';
import 'package:mspaint_bloc/widgets/painter.dart';
import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PainterBloc _bloc = BlocProvider.of<PainterBloc>(context);

    List<Widget> actions;
    actions = <Widget>[
      IconButton(
          icon: const Icon(
            Icons.undo,
          ),
          tooltip: 'Undo',
          onPressed: () {
            if (_bloc.state.pathHistory.isEmpty) {
              _showToast(context, "Nothing to undo");
            } else {
              _bloc
                  .add(UndoEvent(_bloc.state.painter, _bloc.state.pathHistory));
            }
          }),
      IconButton(
          icon: const Icon(
            Icons.redo,
          ),
          tooltip: 'Redo',
          onPressed: () {
            if (_bloc.state.pathHistory.canRedo) {
              _showToast(context, "Nothing to redo");
            } else {
              BlocProvider.of<PainterBloc>(context)
                  .add(RedoEvent(_bloc.state.painter, _bloc.state.pathHistory));
            }
          }),
      IconButton(
          icon: const Icon(Icons.delete),
          tooltip: 'Clear',
          onPressed: () {
            BlocProvider.of<PainterBloc>(context)
                .add(ClearEvent(_bloc.state.painter, _bloc.state.pathHistory));
          }),
      IconButton(
          icon: const Icon(Icons.check),
          onPressed: () => AutoRouter.of(context)
              .push(FinishedDrawScreenRoute(picture: _bloc.state.cached!))),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('MS Paint Code Task'),
        actions: actions,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Expanded(child: Painter(true)),
          PreferredSize(
            child: const MenuBar(),
            preferredSize: Size(MediaQuery.of(context).size.width, 30.0),
          ),
        ],
      ),
    );
  }

  void _showToast(BuildContext context, String snackBarTitle) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(snackBarTitle),
        action: SnackBarAction(
            label: 'CLOSE', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
