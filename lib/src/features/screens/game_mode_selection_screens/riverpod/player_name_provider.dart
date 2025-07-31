import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerNamesProvider = StateProvider<List<String>>((ref) {
  return ['Player 1', 'Player 2', 'Player 3', 'Player 4'];
});

final playerProvider1 = StateProvider<String>((ref)=> "");
final playerProvider2 = StateProvider<String>((ref)=> "");
final playerProvider3 = StateProvider<String>((ref)=> "");
final playerProvider4 = StateProvider<String>((ref)=> "");