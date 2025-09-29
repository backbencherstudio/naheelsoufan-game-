import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkChoicesProvider = StateProvider.family<int, int>((ref, status) {
  return -1;
});

// final checkTrueFalseProvider = StateProvider.family<int, int>((ref, status) {
//   return -1;
// });
//
// final checkChoicesProvider3 = StateProvider.autoDispose.family<int, int>((ref, status) {
//   return -1;
// });


// -1 == null  UI
// 1 == right  UI
// 0 == wrong  UI