import 'package:flutter/material.dart';
import 'package:ainbox/features/auth/signup_tab.dart';
import 'package:ainbox/features/auth/signin_tab.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Authentication"),
          bottom: const TabBar(
            tabs: [Tab(text: "Sign In"), Tab(text: "Sign Up")],
          ),
        ),
        body: const TabBarView(children: [SignInTab(), SignUpTab()]),
      ),
    );
  }
}
