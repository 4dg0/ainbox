import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:ui/config/logger.dart';

Future<void> loadEnv() async {
  const envPath = '../.env';
  await dotenv.load(fileName: envPath, isOptional: true);
  logger.d("dotenv loaded: ${dotenv.env.isNotEmpty}");
  logger.d('PB_URL: ${dotenv.env['PB_URL']}');
}
