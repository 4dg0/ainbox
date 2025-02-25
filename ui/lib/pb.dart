import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:ui/features/auth/token_service.dart';

final pbProvider = FutureProvider<PocketBase>((ref) async {
  final pb = PocketBase(dotenv.env['PB_URL']!);

  final token = await TokenService.getToken();
  if (token != null) {
    pb.authStore.save(token, null);
    try {
      await pb.collection("users").authRefresh();
    } catch (e) {
      pb.authStore.clear();
    }
  }

  return pb;
});
