// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:mspaint_bloc/screens/finished_draw_screen.dart';
import 'package:mspaint_bloc/screens/support_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
        page: SupportScreen,
        initial: true,
        path: '/home',
        name: 'SupportScreenRoute'),
    AutoRoute(
        page: FinishedDrawScreen,
        path: '/finish',
        name: 'FinishedDrawScreenRoute'),
  ],
)
class $AppRouter {}
