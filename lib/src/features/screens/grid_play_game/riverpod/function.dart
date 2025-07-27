import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_play_game/riverpod/page_navigation_notifier.dart';

final isQuestionClicked = StateProvider.family<bool, int>((ref, questionID) {
  return false;
});


final pageIndexProvider =
StateNotifierProvider<PageNavigationNotifier, int>((ref) {
  return PageNavigationNotifier(ref);
});
final pageControllerProvider = Provider<PageController>((ref) {
  return PageController();
});
final isBanishButtonProvider = StateProvider<bool>((ref) => false);
final isSelectedClicked = StateProvider.family<bool, int>((ref, questionID)=>false);
final isSomethingClicked = StateProvider<bool>((ref)=>false);


final isDifficultyClicked1 = StateProvider.family<bool, int>((ref, id)=>false);
final isDifficultyClicked2 = StateProvider.family<bool, int>((ref, id)=>false);
final isDifficultyClicked3 = StateProvider.family<bool, int>((ref, id)=>false);
final isDifficultyVanished = StateProvider<bool>((ref)=>false);

final isRightWrongElse = StateProvider<int>((ref)=>-1);
final isRightWrongElse2 = StateProvider<int>((ref)=>-1);
final huntModeOn = StateProvider<bool>((ref)=>false);
