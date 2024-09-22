import "package:free_api/src/feature/entry/view/pages/splash_page.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "app_route_name.dart";

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell-key');

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell-key');

@immutable
final class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: AppRouteName.splash,
    routes: [
      GoRoute(
        path: AppRouteName.splash,
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: AppRouteName.welcomePage,
        builder: (context, state) => const Scaffold(),
      ),


    ],
  );
}

