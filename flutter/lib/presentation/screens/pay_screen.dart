import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text("Go to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
