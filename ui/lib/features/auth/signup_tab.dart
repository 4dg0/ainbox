import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ainbox/features/auth/auth_provider.dart';

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
            onPressed:
                (!agreeToTerms || authState.isLoading)
                    ? null
                    : () {
                      ref
                          .read(authProvider.notifier)
                          .signUp(
                            emailController.text,
                            passwordController.text,
                            context,
                          );
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
