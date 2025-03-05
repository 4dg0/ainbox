import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ainbox/app/providers/pb.dart';
import 'package:ainbox/features/auth/token_service.dart';

class AuthNotifier extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() {
    return const AsyncData(null);
  }

  Future<void> signIn(String email, String password) async {
    final pb = await ref.read(pbProvider.future);
    state = const AsyncLoading();
    try {
      await pb.collection('users').authWithPassword(email, password);
      await TokenService.saveToken(pb.authStore.token);
      ref.invalidate(pbProvider);
      state = const AsyncData(null);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> signUp(String email, String password) async {
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

      await signIn(email, password);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> signOut(context) async {
    final pb = await ref.read(pbProvider.future);
    await TokenService.deleteToken();
    pb.authStore.clear();
    ref.invalidate(pbProvider);
  }
}

final authProvider = NotifierProvider<AuthNotifier, AsyncValue<void>>(
  () => AuthNotifier(),
);
