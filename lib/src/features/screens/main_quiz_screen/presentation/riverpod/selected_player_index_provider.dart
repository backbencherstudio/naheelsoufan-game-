import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPlayerIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

final isCorrectQuiz = StateProvider.autoDispose<bool>((ref) => false);