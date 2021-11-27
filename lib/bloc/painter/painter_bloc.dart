import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:mspaint_bloc/bloc/painter/painter_event.dart';
import 'package:mspaint_bloc/bloc/painter/painter_state.dart';
import 'package:mspaint_bloc/utils/picture_details.dart';

class PainterBloc extends Bloc<PainterEvent, PainterState> {
  PainterBloc() : super(PainterState.initial()) {
    on<UndoEvent>((event, emit) {
      event.pathHistory.undo();

      emit(
          PainterState(painter: event.painter, pathHistory: event.pathHistory));
    });
    on<RedoEvent>((event, emit) {
      event.pathHistory.redo();

      emit(
          PainterState(painter: event.painter, pathHistory: event.pathHistory));
    });
    on<ClearEvent>((event, emit) {
      event.pathHistory.clear();

      emit(
          PainterState(painter: event.painter, pathHistory: event.pathHistory));
    });
    on<ThicknessEvent>((event, emit) {
      Paint paint = Paint();
      paint.color = event.painter.color;
      paint.blendMode = BlendMode.srcOver;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = event.thickness;

      event.pathHistory.currentPaint = paint;

      emit(PainterState(painter: paint, pathHistory: event.pathHistory));
    });
    on<DrawColorEvent>((event, emit) {
      Paint paint = Paint();
      paint.color = event.drawColor;
      paint.blendMode = event.painter.blendMode;
      paint.style = event.painter.style;
      paint.strokeWidth = event.painter.strokeWidth;

      event.pathHistory.currentPaint = paint;

      emit(PainterState(painter: paint, pathHistory: event.pathHistory));
    });
    on<EraseEvent>((event, emit) {
      Paint paint = Paint();
      paint.color = event.painter.color;
      paint.blendMode = event.isErased;
      paint.style = event.painter.style;
      paint.strokeWidth = event.painter.strokeWidth;

      event.pathHistory.currentPaint = paint;

      emit(PainterState(painter: paint, pathHistory: event.pathHistory));
    });
    on<BackgroundEvent>((event, emit) {
      event.pathHistory.setBackgroundColor(event.backgroundColor);

      emit(PainterState(
        painter: event.painter,
        pathHistory: event.pathHistory,
      ));
    });
    on<PanStartEvent>((event, emit) {
      event.pathHistory.add(event.position);

      emit(
          PainterState(painter: event.painter, pathHistory: event.pathHistory));
    });
    on<PanUpdateEvent>((event, emit) {
      event.pathHistory.updateCurrent(event.position);

      emit(
          PainterState(painter: event.painter, pathHistory: event.pathHistory));
    });
    on<PanEndEvent>((event, emit) {
      event.pathHistory.endCurrent();

      emit(
          PainterState(painter: event.painter, pathHistory: event.pathHistory));
    });
    on<FinishEvent>((event, emit) {
      if (event.finishPicture!().isEmpty) {
        throw StateError('Tried to render a picture with an invalid size!');
      } else {
        PictureRecorder recorder = PictureRecorder();
        Canvas canvas = Canvas(recorder);
        event.pathHistory.draw(canvas, event.finishPicture!());
        PictureDetails finishedPicture = PictureDetails(
            recorder.endRecording(),
            event.finishPicture!().width.floor(),
            event.finishPicture!().height.floor());

        emit(PainterState(
            painter: event.painter,
            pathHistory: event.pathHistory,
            cached: finishedPicture));
      }
    });
  }
}
