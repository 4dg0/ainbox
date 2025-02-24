import 'package:go_router/go_router.dart';

import 'package:ui/features/auth/auth_screen.dart';
import 'package:ui/features/home_screen.dart';
import 'package:ui/features/profile/profile_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/auth',
  redirect: (context, state) {
    final goingToAuth = state.uri.toString() == '/auth';

    if (!isAuthenticated && !goingToAuth) return '/auth';
    if (isAuthenticated && goingToAuth) return '/home';
    return null;
  },
  routes: [
    GoRoute(path: '/auth', builder: (context, state) => AuthScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
  ],
);
