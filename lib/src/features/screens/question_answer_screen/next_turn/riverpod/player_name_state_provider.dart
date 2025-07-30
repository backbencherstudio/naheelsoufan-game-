import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerNameProvider = StateProvider<String>((ref) {
  return 'Player 1';
});

final playerTurnProvider = StateProvider<int>((ref) => 0); // 0 -> Player 1, 1 -> Player 2, etc.

