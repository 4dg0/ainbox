import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ui/features/auth/auth_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                isAuthenticated = false;
                context.go('/auth');
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
