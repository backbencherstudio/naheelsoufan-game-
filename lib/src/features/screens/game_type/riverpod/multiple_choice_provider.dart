import 'package:flutter_riverpod/flutter_riverpod.dart';
final resetVersionProvider = StateProvider<int>((ref) => 0);

final checkChoicesProvider = StateProvider.autoDispose.family<int, int>((ref, status) {
  ref.watch(resetVersionProvider);
  return -1;
});

final checkChoicesProvider2 = StateProvider.autoDispose.family<int, int>((ref, status) {
  ref.watch(resetVersionProvider);
  return -1;
});

final checkChoicesProvider3 = StateProvider.autoDispose.family<int, int>((ref, status) {
  ref.watch(resetVersionProvider);
  return -1;
});