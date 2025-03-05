import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ainbox/app/config/logger.dart';
import 'package:ainbox/features/user/user_model.dart';
import 'package:ainbox/app/providers/pb.dart';

final userProvider = FutureProvider<User>((ref) async {
  final pb = await ref.watch(pbProvider.future);

  final record = await pb.collection('users').authRefresh();
  logger.d('auth user record: $record');

  final userJson = record.toJson();
  return User.fromJson(userJson);
});
