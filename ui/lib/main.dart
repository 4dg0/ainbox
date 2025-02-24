import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:ui/config/logger.dart';
import 'package:ui/router.dart';

void main() async {
  const envPath = '../.env';
  await dotenv.load(fileName: envPath, isOptional: true);

  logger.d("dotenv loaded: ${dotenv.env.isNotEmpty}");

  logger.d('PB_URL: ${dotenv.env['PB_URL']}');
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}
