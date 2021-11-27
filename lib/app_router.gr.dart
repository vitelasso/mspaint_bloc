// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import 'screens/finished_draw_screen.dart' as _i2;
import 'screens/support_screen.dart' as _i1;
import 'utils/picture_details.dart' as _i5;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SupportScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SupportScreen());
    },
    FinishedDrawScreenRoute.name: (routeData) {
      final args = routeData.argsAs<FinishedDrawScreenRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.FinishedDrawScreen(picture: args.picture, key: args.key));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i3.RouteConfig(SupportScreenRoute.name, path: '/home'),
        _i3.RouteConfig(FinishedDrawScreenRoute.name, path: '/finish')
      ];
}

/// generated route for [_i1.SupportScreen]
class SupportScreenRoute extends _i3.PageRouteInfo<void> {
  const SupportScreenRoute() : super(name, path: '/home');

  static const String name = 'SupportScreenRoute';
}

/// generated route for [_i2.FinishedDrawScreen]
class FinishedDrawScreenRoute
    extends _i3.PageRouteInfo<FinishedDrawScreenRouteArgs> {
  FinishedDrawScreenRoute({required _i5.PictureDetails picture, _i4.Key? key})
      : super(name,
            path: '/finish',
            args: FinishedDrawScreenRouteArgs(picture: picture, key: key));

  static const String name = 'FinishedDrawScreenRoute';
}

class FinishedDrawScreenRouteArgs {
  const FinishedDrawScreenRouteArgs({required this.picture, this.key});

  final _i5.PictureDetails picture;

  final _i4.Key? key;
}
