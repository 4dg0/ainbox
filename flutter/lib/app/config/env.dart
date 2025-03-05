import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:ainbox/app/config/logger.dart';

Future<void> loadEnv() async {
  await dotenv.load(fileName: '.env', isOptional: true);
  logger.d("dotenv loaded: ${dotenv.env.isNotEmpty}");
  logger.d('PB_URL: ${dotenv.env['PB_URL']}');
}
