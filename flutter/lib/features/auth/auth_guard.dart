import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ainbox/app/providers/pb.dart';
import 'package:ainbox/presentation/screens/auth_screen.dart';

class AuthGuard extends ConsumerWidget {
  final Widget child;

  const AuthGuard({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pbAsync = ref.watch(pbProvider);

    return pbAsync.when(
      loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (_, __) => AuthScreen(),
      data: (pb) {
        if (!pb.authStore.isValid) {
          return AuthScreen();
        }
        return child;
      },
    );
  }
}
