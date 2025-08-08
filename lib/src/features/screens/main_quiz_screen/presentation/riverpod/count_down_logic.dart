import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountdownNotifier extends StateNotifier<int> {
  final int _initialStart;
  Timer? _timer;

  CountdownNotifier(super.start)
      : _initialStart = start {
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--;
      } else {
        timer.cancel();
      }
    });
  }

  void reset() {
    _timer?.cancel();
    state = _initialStart;
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
