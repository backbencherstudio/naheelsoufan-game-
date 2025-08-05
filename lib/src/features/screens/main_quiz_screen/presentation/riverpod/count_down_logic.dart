// countdown_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

final countdownProvider = StateNotifierProvider.family<CountdownNotifier, int, int>(
      (ref, start) => CountdownNotifier(start),
);

class CountdownNotifier extends StateNotifier<int> {
  Timer? _timer;

  CountdownNotifier(super.start) {
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--;
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
