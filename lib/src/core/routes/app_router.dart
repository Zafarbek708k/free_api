import "package:free_api/src/feature/chat/view/pages/chat.dart";
import "package:free_api/src/feature/double/view/pages/double_chat.dart";
import "package:free_api/src/feature/home/view/pages/home.dart";
import "package:free_api/src/feature/home/view/pages/splash_page.dart";
import "package:flutter/material.dart";
import "package:free_api/src/feature/speech_to_text/view/speech_to_text.dart";
import "package:go_router/go_router.dart";
import "../../feature/animation/view/pages/animation_page.dart";
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
        path: AppRouteName.animation,
        builder: (context, state) => const CustomPulseAnimation(),
      ),
      GoRoute(
        path: AppRouteName.speechToText,
        builder: (context, state) => const VoiceToTextScreen(),
      ),


      GoRoute(
        path: AppRouteName.home,
        builder: (context, state) => const Home(),
      ),

      GoRoute(
        path: AppRouteName.chat,
        builder: (context, state) => const Chat(),
      ),

      GoRoute(
        path: AppRouteName.doubleChat,
        builder: (context, state) => const DoubleChat(),
      ),


    ],
  );
}

