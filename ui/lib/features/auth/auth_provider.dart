import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ainbox/config/pb.dart';
import 'package:ainbox/features/auth/token_service.dart';

class AuthNotifier extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() {
    return const AsyncData(null);
  }

  Future<void> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    final pb = await ref.read(pbProvider.future);
    state = const AsyncLoading();
    try {
      await pb.collection('users').authWithPassword(email, password);
      await TokenService.saveToken(pb.authStore.token);
      ref.invalidate(pbProvider);
      state = const AsyncData(null);

      Future.microtask(() {
        if (context.mounted) context.go('/home');
      });
    } catch (e, stack) {
      state = AsyncError(e, stack);
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  Future<void> signUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    final pb = await ref.read(pbProvider.future);
    state = const AsyncLoading();
    try {
      await pb
          .collection('users')
          .create(
            body: {
              "email": email,
              "password": password,
              "passwordConfirm": password,
              "credits": 1000,
              "status": "free",
              "name": "user1278",
            },
          );

      if (!context.mounted) return;
      await signIn(email, password, context);
    } catch (e, stack) {
      state = AsyncError(e, stack);
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  Future<void> signOut(BuildContext context) async {
    final pb = await ref.read(pbProvider.future);
    await TokenService.deleteToken();
    pb.authStore.clear();
    ref.invalidate(pbProvider);

    Future.microtask(() {
      if (context.mounted) context.go('/auth');
    });
  }
}

final authProvider = NotifierProvider<AuthNotifier, AsyncValue<void>>(
  () => AuthNotifier(),
);
