import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ainbox/features/auth/auth_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/profile'),
              child: const Text("Go to Profile"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/payment'),
              child: const Text("Go to Payment"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await ref.read(authProvider.notifier).signOut(context);
                Future.microtask(() {
                  if (context.mounted) context.go('/auth');
                });
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
