import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mspaint_bloc/bloc/painter/painter_bloc.dart';
import 'package:mspaint_bloc/bloc/painter/painter_event.dart';
import 'package:mspaint_bloc/bloc/painter/painter_state.dart';
import 'package:mspaint_bloc/utils/painter_painter.dart';
import 'package:flutter/material.dart' hide Image;

/// A very simple widget that supports drawing using touch.
class Painter extends StatefulWidget {
  //final PainterController painterController;
  final bool useGrid;

  /// Creates an instance of this widget that operates on top of the supplied [PainterController].
  const Painter(this.useGrid, {Key? key}) : super(key: key);

  @override
  _PainterState createState() => _PainterState();
}

class _PainterState extends State<Painter> {
  late PainterBloc bloc;

  @override
  void initState() {
    super.initState();
  }

  Size _finish() {
    setState(() {});
    return context.size ?? const Size(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<PainterBloc>(context);
    bloc.add(FinishEvent(bloc.state.painter, bloc.state.pathHistory, _finish));
    return BlocBuilder<PainterBloc, PainterState>(
        bloc: bloc,
        builder: (context, state) {
          return SizedBox(
            child: GestureDetector(
              child: ClipRect(
                  child: CustomPaint(
                willChange: true,
                painter: PainterPainter(state.pathHistory, widget.useGrid),
              )),
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanEnd,
            ),
            width: double.infinity,
            height: double.infinity,
          );
        });
  }

  void _onPanStart(DragStartDetails start) {
    Offset pos = (context.findRenderObject() as RenderBox)
        .globalToLocal(start.globalPosition);
    bloc.add(PanStartEvent(bloc.state.painter, bloc.state.pathHistory, pos));
  }

  void _onPanUpdate(DragUpdateDetails update) {
    Offset pos = (context.findRenderObject() as RenderBox)
        .globalToLocal(update.globalPosition);
    bloc.add(PanUpdateEvent(bloc.state.painter, bloc.state.pathHistory, pos));
  }

  void _onPanEnd(DragEndDetails end) {
    bloc.add(PanEndEvent(bloc.state.painter, bloc.state.pathHistory));
  }
}
