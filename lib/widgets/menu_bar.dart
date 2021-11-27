import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mspaint_bloc/bloc/painter/painter_bloc.dart';
import 'package:mspaint_bloc/bloc/painter/painter_event.dart';
import 'package:mspaint_bloc/bloc/painter/painter_state.dart';
import 'package:mspaint_bloc/widgets/color_picker_button.dart';
import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PainterBloc>(context);
    return BlocBuilder<PainterBloc, PainterState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Slider(
                    value: state.painter.strokeWidth,
                    onChanged: (double value) => bloc.add(ThicknessEvent(
                        bloc.state.painter, bloc.state.pathHistory, value)),
                    min: 1.0,
                    max: 20.0,
                    activeColor: Colors.white,
                  );
                })),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return IconButton(
                      icon: state.painter.blendMode == BlendMode.clear
                          ? const Icon(Icons.clear)
                          : const Icon(Icons.create),
                      color: Colors.white,
                      tooltip: (state.painter.blendMode == BlendMode.clear
                              ? 'Disable'
                              : 'Enable') +
                          ' eraser',
                      onPressed: () {
                        bloc.add(EraseEvent(
                            state.painter,
                            state.pathHistory,
                            state.painter.blendMode == BlendMode.clear
                                ? BlendMode.srcOver
                                : BlendMode.clear));
                      });
                }),
                ColorPickerButton(false),
                ColorPickerButton(true),
              ],
            ),
          );
        });
  }
}
