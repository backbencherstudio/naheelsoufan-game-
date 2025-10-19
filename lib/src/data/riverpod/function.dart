import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/features/screens/grid_style/choose_multiple_category/riverpod/page_navigation_notifier.dart';

final isQuestionClicked = StateProvider.family<bool, int>((ref, questionID) {
  return false;
});
final isBanishButtonProvider = StateProvider<bool>((ref) => false);

final checkSecondDifficultyScreen = StateProvider<bool>((ref) => false);

final isRightWrongElse = StateProvider<int>((ref)=>-1);

final huntModeOn = StateProvider<bool>((ref)=>false);

final showTimeUp = StateProvider.autoDispose<bool>((ref)=>true);

final isClose = StateProvider<bool>((ref)=>false);
