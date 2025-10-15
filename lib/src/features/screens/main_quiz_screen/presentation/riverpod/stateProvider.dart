import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPlayerIndexProvider = StateProvider<int>((ref) => -1);



final isCorrectQuiz = StateProvider<bool>((ref) {
  return false;
});

final isWrongPoped = StateProvider<bool>((ref)=>false);

