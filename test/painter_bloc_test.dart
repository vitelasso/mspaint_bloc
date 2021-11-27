// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mspaint_bloc/bloc/painter/painter_bloc.dart';
import 'package:mspaint_bloc/bloc/painter/painter_event.dart';
import 'package:mspaint_bloc/bloc/painter/painter_state.dart';
import 'package:mspaint_bloc/utils/path_history.dart';

@GenerateMocks([Paint, PathHistory])
void main() {
  Paint? mockPainter;
  PathHistory? mockPathHistory;
  PainterBloc? painterBloc;

  setUpAll(() {
    mockPainter = Paint();
    mockPathHistory = PathHistory();
    painterBloc = PainterBloc();
  });
  group('Painter bloc', () {
    test('initial state is correct', () {
      expect(painterBloc?.state, PainterState.initial());
    });

    blocTest<PainterBloc, PainterState>(
      ' emits PainterState with correct stroke width when successful ThicknessEvent',
      build: () => painterBloc!,
      act: (bloc) =>
          bloc.add(ThicknessEvent(mockPainter!, mockPathHistory!, 10.0)),
      expect: () {
        mockPainter!.strokeWidth = 10.0;
        return [
          PainterState(painter: mockPainter!, pathHistory: mockPathHistory!)
        ];
      },
    );
  });
}
