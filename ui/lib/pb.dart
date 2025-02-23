import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';

final pbProvider = Provider<PocketBase>((ref) {
  return PocketBase('https://your-pocketbase-url.com');
});
