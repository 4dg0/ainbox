import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ainbox/features/auth/auth_service.dart';

class SignInTab extends ConsumerStatefulWidget {
  const SignInTab({super.key});

  @override
  ConsumerState<SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends ConsumerState<SignInTab> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed:
                (authState.isLoading)
                    ? null
                    : () async {
                      await ref
                          .read(authProvider.notifier)
                          .signIn(
                            emailController.text,
                            passwordController.text,
                          );
                      if (context.mounted) context.push('/home');
                    },
            child:
                authState.isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
