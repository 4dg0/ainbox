import 'package:ainbox/config/logger.dart';
import 'package:ainbox/config/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ainbox/config/pb.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pbFuture = ref.watch(pbProvider.future);
    logger.d("SplashScreen: pbState: $pbFuture");

    pbFuture.then((pb) {
      if (pb.authStore.isValid) {
        GoRouter.of(rootNavKey.currentContext!).go('/home');
      } else {
        GoRouter.of(rootNavKey.currentContext!).go('/auth');
      }
    });

    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
