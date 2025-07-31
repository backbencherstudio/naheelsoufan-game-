import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerSelectionNamesProvider = StateProvider<List<String>>((ref) {
  return ['Player 1', 'Player 2', 'Player 3', 'Player 4'];
});

final playerSelectionProvider1 = StateProvider<String>((ref)=> "");
final playerSelectionProvider2 = StateProvider<String>((ref)=> "");
final playerSelectionProvider3 = StateProvider<String>((ref)=> "");
final playerSelectionProvider4 = StateProvider<String>((ref)=> "");

