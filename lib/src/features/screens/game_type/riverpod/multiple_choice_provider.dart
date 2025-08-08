import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkChoicesProvider = StateProvider.family<int, int>((ref, status) {
  return -1;
});

final checkChoicesProvider2 = StateProvider.autoDispose.family<int, int>((ref, status) {
  return -1;
});

final checkChoicesProvider3 = StateProvider.autoDispose.family<int, int>((ref, status) {
  return -1;
});