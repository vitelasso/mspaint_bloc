import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mspaint_bloc/utils/path_history.dart';

abstract class PainterEvent extends Equatable {
  const PainterEvent();
}

class UndoEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;

  const UndoEvent(this.painter, this.pathHistory);

  @override
  List<Object?> get props => [];
}

class RedoEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;

  const RedoEvent(this.painter, this.pathHistory);

  @override
  List<Object?> get props => [];
}

class ClearEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;

  const ClearEvent(this.painter, this.pathHistory);

  @override
  List<Object?> get props => [];
}

class ThicknessEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final double thickness;

  const ThicknessEvent(this.painter, this.pathHistory, this.thickness);

  @override
  List<Object?> get props => [];
}

class DrawColorEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final Color drawColor;

  const DrawColorEvent(this.painter, this.pathHistory, this.drawColor);

  @override
  List<Object?> get props => [];
}

class BackgroundEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final Color backgroundColor;

  const BackgroundEvent(this.painter, this.pathHistory, this.backgroundColor);

  @override
  List<Object?> get props => [];
}

class EraseEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final BlendMode isErased;

  const EraseEvent(this.painter, this.pathHistory, this.isErased);

  @override
  List<Object?> get props => [];
}

class PanStartEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final Offset position;

  const PanStartEvent(this.painter, this.pathHistory, this.position);

  @override
  List<Object?> get props => [];
}

class PanUpdateEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final Offset position;

  const PanUpdateEvent(this.painter, this.pathHistory, this.position);

  @override
  List<Object?> get props => [];
}

class PanEndEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;

  const PanEndEvent(this.painter, this.pathHistory);

  @override
  List<Object?> get props => [];
}

class FinishEvent extends PainterEvent {
  final Paint painter;
  final PathHistory pathHistory;
  final ValueGetter<Size>? finishPicture;

  const FinishEvent(this.painter, this.pathHistory, this.finishPicture);

  @override
  List<Object?> get props => [];
}
