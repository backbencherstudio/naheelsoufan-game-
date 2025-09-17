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