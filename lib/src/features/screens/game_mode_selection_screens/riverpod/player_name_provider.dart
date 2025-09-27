import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naheelsoufan_game/src/features/screens/game_mode_selection_screens/riverpod/selection_provider.dart';

final playerProvider1 = StateProvider<String>((ref) => "Player 1");
final playerProvider2 = StateProvider<String>((ref) => "Player 2");
final playerProvider3 = StateProvider<String>((ref) => "");
final playerProvider4 = StateProvider<String>((ref) => "");

final playerNamesProvider = StateProvider<List<String>>((ref) {
  final p1 = ref.watch(playerProvider1);
  final p2 = ref.watch(playerProvider2);
  final p3 = ref.watch(playerProvider3);
  final p4 = ref.watch(playerProvider4);

  final selectedTiles = ref.watch(selectionProvider).selectedTiles;
  final fixedPlayers = {0: true, 1: true};
  final allPlayers = {...fixedPlayers, ...selectedTiles};

  final names = <String>[];
  if (allPlayers.containsKey(0)) names.add(p1.isNotEmpty ? p1 : "Player 1");
  if (allPlayers.containsKey(1)) names.add(p2.isNotEmpty ? p2 : "Player 2");
  if (allPlayers.containsKey(2)) names.add(p3.isNotEmpty ? p3 : "Player 3");
  if (allPlayers.containsKey(3)) names.add(p4.isNotEmpty ? p4 : "Player 4");

  return names;
});