import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPlayerIndexProvider = StateProvider<int>((ref) => -1);

class PlayerManage{
  final int currentPlayer;
  final int stealPlayer;
  final int totalPlayer;

  PlayerManage({
    required this.currentPlayer,
    required this.totalPlayer,
    required this.stealPlayer
  });
  PlayerManage copyWith({
    int? currentPlayer,
    int? totalPlayer,
    int? stealPlayer,
  }){
    return PlayerManage(currentPlayer: currentPlayer ?? this.currentPlayer, totalPlayer: totalPlayer ?? this.totalPlayer, stealPlayer: stealPlayer ?? this.stealPlayer);
  }
}

final playerProvider = StateProvider<PlayerManage>((ref)=>PlayerManage(
    totalPlayer: 2,
    currentPlayer: 0,
    stealPlayer: -1
));

final isCorrectQuiz = StateProvider<bool>((ref) {
  return false;
});

