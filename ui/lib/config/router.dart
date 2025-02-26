import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ainbox/config/logger.dart';

import 'package:ainbox/features/auth/auth_screen.dart';
import 'package:ainbox/features/pay/pay_screen.dart';
import 'package:ainbox/features/user/user_screen.dart';
import 'package:ainbox/features/home_screen.dart';
import 'package:ainbox/config/pb.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    redirect: (context, state) async {
      logger.d('Redirecting to ${state.uri}');
      final goingToAuth = state.uri.toString() == '/auth';

      final pb = await ref.read(pbProvider.future);

      if (!pb.authStore.isValid && !goingToAuth) return '/auth';
      if (pb.authStore.isValid && goingToAuth) return '/home';
      return null;
    },
    routes: [
      GoRoute(path: '/auth', builder: (context, state) => AuthScreen()),
      GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/profile', builder: (context, state) => UserScreen()),
      GoRoute(path: '/payment', builder: (context, state) => PayScreen()),
    ],
  );
});
