import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerManage {
  final int currentPlayer;
  final int stealPlayer;
  final int totalPlayer;

  PlayerManage({
    required this.currentPlayer,
    required this.totalPlayer,
    required this.stealPlayer,
  });
  PlayerManage copyWith({
    int? currentPlayer,
    int? totalPlayer,
    int? stealPlayer,
  }) {
    return PlayerManage(
      currentPlayer: currentPlayer ?? this.currentPlayer,
      totalPlayer: totalPlayer ?? this.totalPlayer,
      stealPlayer: stealPlayer ?? this.stealPlayer,
    );
  }
}

final playerProvider = StateProvider<PlayerManage>((ref) {
  return PlayerManage(totalPlayer: 2, currentPlayer: 0, stealPlayer: -1);
});

class PlayerNamesNotifier extends ChangeNotifier {
  final List<String> _playerNames;

  PlayerNamesNotifier(List<String>? initialPlayers)
    : _playerNames = initialPlayers ?? [];

  List<String> get playerNames => List.unmodifiable(_playerNames);

  void addPlayer(String playerName) {
    _playerNames.add(playerName);
    notifyListeners();
  }

  void updatePlayerName(int index, String newName) {
    if (index >= 0 && index < _playerNames.length) {
      _playerNames[index] = newName;
      notifyListeners();
    }
  }

  void removeLastPlayer() {
    if (_playerNames.isNotEmpty) {
      _playerNames.removeLast();
      notifyListeners();
    }
  }

  void removePlayerAt(int index) {
    if (index >= 0 && index < _playerNames.length) {
      _playerNames.removeAt(index);
      notifyListeners();
    }
  }
}

final playerNameProvider = ChangeNotifierProvider<PlayerNamesNotifier>(
  (ref) => PlayerNamesNotifier(["Player 1", "Player 2"]),
);

final addPlayerTileSelection = StateProvider<int>((ref) => -1);

final questionCountProvider = StateProvider<int>((ref) => 0);
