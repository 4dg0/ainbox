import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ainbox/config/env.dart';
import 'package:ainbox/config/router.dart';

// main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await load_env();

  runApp(ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'ainbox',
      routerConfig: router,
      builder: (context, child) {
        if (child == null) {
          return const SplashScreen();
        }
        return ColoredBox(
          color:
              Theme.of(context).brightness == Brightness.light
                  ? Colors.pink
                  : Colors.red,
          child: child,
        );
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
