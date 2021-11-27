import 'package:flutter/material.dart';
import 'package:mspaint_bloc/utils/path_history.dart';

abstract class PainterEvent {}

class UndoEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;

  UndoEvent(this.painter, this.pathHistory);
}

class RedoEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;

  RedoEvent(this.painter, this.pathHistory);
}

class ClearEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;

  ClearEvent(this.painter, this.pathHistory);
}

class ThicknessEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final double thickness;

  ThicknessEvent(this.painter, this.pathHistory, this.thickness);
}

class DrawColorEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final Color drawColor;

  DrawColorEvent(this.painter, this.pathHistory, this.drawColor);
}

class BackgroundEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final Color backgroundColor;

  BackgroundEvent(this.painter, this.pathHistory, this.backgroundColor);
}

class EraseEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final BlendMode isErased;

  EraseEvent(this.painter, this.pathHistory, this.isErased);
}

class PanStartEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final Offset position;

  PanStartEvent(this.painter, this.pathHistory, this.position);
}

class PanUpdateEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final Offset position;

  PanUpdateEvent(this.painter, this.pathHistory, this.position);
}

class PanEndEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;

  PanEndEvent(this.painter, this.pathHistory);
}

class FinishEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final ValueGetter<Size>? finishPicture;

  FinishEvent(this.painter, this.pathHistory, this.finishPicture);
}
