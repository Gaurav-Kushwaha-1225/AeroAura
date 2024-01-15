import 'dart:convert';

import 'package:aeroaura/screens/home/home.dart';
import 'package:aeroaura/screens/next_7_days/next_7_days.dart';
import 'package:aeroaura/utils/routes_consts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AeroAuraRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: AeroAuraRoutesNames.homePage,
        path: "/",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(key: state.pageKey, child: const HomePage());
        },
      ),
      GoRoute(
        name: AeroAuraRoutesNames.nextSevenDaysPage,
        path: "/nextdays/:daily/:daily_units",
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: NextSevenDaysPage(
              daily: jsonDecode(state.pathParameters['daily']!),
              daily_units: jsonDecode(state.pathParameters['daily_units']!),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.centerRight,
                  child: child);
            },
          );
        },
      ),
    ], // TODO: Add Error Page Builder
  );
}
