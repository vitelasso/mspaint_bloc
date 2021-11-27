import 'package:mspaint_bloc/utils/path_history.dart';
import 'package:flutter/material.dart';

class PainterPainter extends CustomPainter {
  final PathHistory _path;
  final bool useGrid;

  PainterPainter(this._path, this.useGrid) : super();

  @override
  void paint(Canvas canvas, Size size) {
    _path.draw(canvas, size);

    if (useGrid) {
      final height = size.height;
      final width = size.width;
      final paint = Paint();

      Path mainBackground = Path();
      mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
      paint.color = Colors.teal;

      final heightLine = height ~/ 10; // your Horizontal line
      final widthLine = (width ~/ 5); // your Vertical line

      for (int i = 1; i < height; i++) {
        if (i % heightLine == 0) {
          Path linePath = Path();
          linePath.addRect(
              Rect.fromLTRB(0, i.toDouble(), width, (i + 2).toDouble()));
          canvas.drawPath(linePath, paint);
        }
      }
      for (int i = 1; i < width; i++) {
        if (i % widthLine == 0) {
          Path linePath = Path();
          linePath.addRect(
              Rect.fromLTRB(i.toDouble(), 0, (i + 2).toDouble(), height));
          canvas.drawPath(linePath, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(PainterPainter oldDelegate) {
    return true;
  }
}
