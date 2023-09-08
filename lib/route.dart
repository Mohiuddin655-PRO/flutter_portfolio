import 'package:flutter_andomie/core.dart';
import 'package:go_router/go_router.dart';

import 'index.dart';

class AppRouter {
  AppRouter._();

  static AppRouter get I => AppRouter._();

  GoRouter get router => GoRouter(
        initialLocation: "${ScreenType.main.route}${ScreenType.about.route}",
        routes: <RouteBase>[
          GoRoute(
            name: ScreenType.main.route,
            path: '${ScreenType.main.route}:name',
            builder: (context, state) {
              var type = state.pathParameters.getValue<String>("name");
              return MainActivity(
                type: ScreenType.from(type ?? ""),
                data: state.extra,
              );
            },
          ),
        ],
      );
}
