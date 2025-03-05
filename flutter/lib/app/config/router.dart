import 'package:ainbox/features/auth/auth_guard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ainbox/presentation/screens/splash_screen.dart';
import 'package:ainbox/presentation/screens/auth_screen.dart';
import 'package:ainbox/presentation/screens/pay_screen.dart';
import 'package:ainbox/presentation/screens/user_screen.dart';
import 'package:ainbox/presentation/screens/home_screen.dart';

final rootNavKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/auth', builder: (context, state) => AuthScreen()),
    GoRoute(
      path: '/home',
      builder: (context, state) => AuthGuard(child: HomeScreen()),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => AuthGuard(child: UserScreen()),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => AuthGuard(child: PayScreen()),
    ),
  ],
);
