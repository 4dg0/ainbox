import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ui/features/auth/auth_screen.dart';
import 'package:ui/features/home_screen.dart';
import 'package:ui/features/user/user_screen.dart';
import 'package:ui/pb.dart';

final GoRouter router = GoRouter(
  initialLocation: '/auth',
  redirect: (context, state) async {
    final container = ProviderScope.containerOf(context);
    final pb = await container.read(pbProvider.future);
    final goingToAuth = state.uri.toString() == '/auth';

    if (!pb.authStore.isValid && !goingToAuth) return '/auth';
    if (pb.authStore.isValid && goingToAuth) return '/home';
    return null;
  },
  routes: [
    GoRoute(path: '/auth', builder: (context, state) => AuthScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/profile', builder: (context, state) => UserScreen()),
  ],
);
