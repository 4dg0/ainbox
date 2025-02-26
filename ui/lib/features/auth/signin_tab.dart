import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ainbox/features/auth/auth_provider.dart';

class SignInTab extends ConsumerWidget {
  const SignInTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
            onPressed:
                authState.isLoading
                    ? null
                    : () {
                      ref
                          .read(authProvider.notifier)
                          .signIn(
                            emailController.text,
                            passwordController.text,
                            context,
                          );
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
