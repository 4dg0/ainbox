import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ainbox/features/auth/auth_service.dart';

class SignUpTab extends ConsumerStatefulWidget {
  const SignUpTab({super.key});

  @override
  ConsumerState<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends ConsumerState<SignUpTab> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool agreeToTerms = false;

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
          Row(
            children: [
              Checkbox(
                value: agreeToTerms,
                onChanged: (value) {
                  setState(() => agreeToTerms = value ?? false);
                },
              ),
              const Text("Agree with Terms of Use"),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed:
                (!agreeToTerms || authState.isLoading)
                    ? null
                    : () async {
                      await ref
                          .read(authProvider.notifier)
                          .signUp(
                            emailController.text,
                            passwordController.text,
                          );
                      if (context.mounted) context.push('/home');
                    },
            child:
                authState.isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
