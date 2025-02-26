import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ainbox/features/splash/splash_screen.dart';
import 'package:ainbox/features/auth/auth_screen.dart';
import 'package:ainbox/features/pay/pay_screen.dart';
import 'package:ainbox/features/user/user_screen.dart';
import 'package:ainbox/features/home_screen.dart';

final rootNavKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
      GoRoute(path: '/auth', builder: (context, state) => AuthScreen()),
      GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/profile', builder: (context, state) => UserScreen()),
      GoRoute(path: '/payment', builder: (context, state) => PayScreen()),
    ],
  );
});
