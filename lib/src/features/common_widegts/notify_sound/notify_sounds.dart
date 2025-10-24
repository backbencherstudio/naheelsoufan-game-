import 'package:audioplayers/audioplayers.dart';

class NotifySounds {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playSound(String soundPath) async {
    await _audioPlayer.play(AssetSource(soundPath));
  }

  playCorrectSound() {
    _playSound('sounds/correct.mp3');
  }

  playWrongSound() {
    _playSound('sounds/wrong.mp3');
  }

  playLeaderBoardSound() {
    _playSound('sounds/leaderboard.mp3');
  }
}