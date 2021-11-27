import 'package:flutter/material.dart';
import 'package:mspaint_bloc/utils/path_history.dart';
import 'package:mspaint_bloc/utils/picture_details.dart';

class PainterState {
  final Paint painter;
  final PathHistory pathHistory;
  final PictureDetails? cached;

  const PainterState({
    required this.painter,
    required this.pathHistory,
    this.cached,
  });

  factory PainterState.initial() {
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.blendMode = BlendMode.srcOver;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5.0;

    PathHistory pathHistory = PathHistory();
    pathHistory.currentPaint = paint;
    pathHistory.setBackgroundColor(Colors.white);

    return PainterState(
      painter: paint,
      pathHistory: pathHistory,
      cached: null,
    );
  }
}
