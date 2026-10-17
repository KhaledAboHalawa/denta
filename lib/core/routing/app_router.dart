import 'package:denta/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/register/presentation/screens/register_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.registerPath,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePaths.registerPath,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
     
    ),
  ],
);
