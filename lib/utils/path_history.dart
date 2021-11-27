import 'package:flutter/material.dart' hide Image;

class PathHistory {
  final List<MapEntry<Path, Paint>> _paths, _backupPaths;
  Paint currentPaint;
  final Paint _backgroundPaint;
  bool _inDrag;

  bool get isEmpty => _paths.isEmpty || (_paths.length == 1 && _inDrag);

  bool get canRedo =>
      _backupPaths.isEmpty || (_backupPaths.length == 1 && _inDrag);

  Color get backgroundColor => _backgroundPaint.color;

  PathHistory()
      : _paths = <MapEntry<Path, Paint>>[],
        _backupPaths = <MapEntry<Path, Paint>>[],
        _inDrag = false,
        _backgroundPaint = Paint()..blendMode = BlendMode.dstOver,
        currentPaint = Paint()
          ..color = Colors.black
          ..strokeWidth = 1.0
          ..style = PaintingStyle.fill;

  void setBackgroundColor(Color backgroundColor) {
    _backgroundPaint.color = backgroundColor;
  }

  void undo() {
    if (!_inDrag) {
      final last = _paths.removeLast();
      _backupPaths.add(last);
    }
  }

  void redo() {
    if (_backupPaths.isEmpty) {
      return;
    }

    final last = _backupPaths.removeLast();
    _paths.add(last);
  }

  void clear() {
    if (!_inDrag) {
      _paths.clear();
      _backupPaths.clear();
    }
  }

  void add(Offset startPoint) {
    if (!_inDrag) {
      _inDrag = true;
      Path path = Path();
      path.moveTo(startPoint.dx, startPoint.dy);
      _paths.add(MapEntry<Path, Paint>(path, currentPaint));
    }
  }

  void updateCurrent(Offset nextPoint) {
    if (_inDrag) {
      Path path = _paths.last.key;
      path.lineTo(nextPoint.dx, nextPoint.dy);
    }
  }

  void endCurrent() {
    _inDrag = false;
  }

  void draw(Canvas canvas, Size size) {
    canvas.saveLayer(Offset.zero & size, Paint());
    for (MapEntry<Path, Paint> path in _paths) {
      Paint p = path.value;
      canvas.drawPath(path.key, p);
    }
    canvas.drawRect(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height), _backgroundPaint);
    canvas.restore();
  }
}
