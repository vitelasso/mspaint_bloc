import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:mspaint_bloc/bloc/painter/painter_bloc.dart';
import 'package:mspaint_bloc/bloc/painter/painter_event.dart';
import 'package:mspaint_bloc/bloc/painter/painter_state.dart';

// ignore: must_be_immutable
class ColorPickerButton extends StatelessWidget {
  final bool _background;
  late PainterBloc bloc;

  ColorPickerButton(this._background, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<PainterBloc>(context);
    return BlocBuilder<PainterBloc, PainterState>(builder: (context, state) {
      return IconButton(
          icon: Icon(_iconData,
              color: _background
                  ? state.pathHistory.backgroundColor
                  : state.painter.color),
          tooltip:
              _background ? 'Change background color' : 'Change draw color',
          onPressed: () => show(state, context,
              _background ? 'Change background color' : 'Change draw color'));
    });
  }

  Future<Color?> show(
      PainterState state, BuildContext context, String dialogTitle) {
    Color pickerColor =
        _background ? state.pathHistory.backgroundColor : state.painter.color;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(dialogTitle),
          content: SingleChildScrollView(
            child: BlockPicker(
                pickerColor: _background
                    ? state.pathHistory.currentPaint.color
                    : state.painter.color,
                onColorChanged: (value) {
                  pickerColor = value;
                },
                availableColors: const [
                  Colors.red,
                  Colors.blue,
                  Colors.green,
                  Colors.yellow,
                  Colors.pink,
                ]),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                if (_background) {
                  bloc.add(BackgroundEvent(
                      state.painter, state.pathHistory, pickerColor));
                } else {
                  bloc.add(DrawColorEvent(
                      state.painter, state.pathHistory, pickerColor));
                }
                Navigator.of(context).pop(_background
                    ? state.pathHistory.backgroundColor
                    : state.painter.color);
              },
            ),
          ],
        );
      },
    );
  }

  IconData get _iconData => _background ? Icons.format_color_fill : Icons.brush;
}
