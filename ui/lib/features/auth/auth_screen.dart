import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

bool isAuthenticated = false;

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            isAuthenticated = true;
            context.go('/home');
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
