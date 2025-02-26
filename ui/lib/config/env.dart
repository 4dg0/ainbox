import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:ainbox/config/logger.dart';

Future<void> load_env() async {
  const envPath = '.env';
  await dotenv.load(fileName: envPath, isOptional: true);
  logger.d("dotenv loaded: ${dotenv.env.isNotEmpty}");
  logger.d('PB_URL: ${dotenv.env['PB_URL']}');
}
