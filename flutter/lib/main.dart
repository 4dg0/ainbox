import 'package:ainbox/app/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ainbox/app/config/env.dart';
import 'package:ainbox/app/config/router.dart';

// main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadEnv();

  runApp(ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return MaterialApp.router(
      title: dotenv.env["APP_NAME"],
      theme: theme,
      routerConfig: router,
    );
  }
}
