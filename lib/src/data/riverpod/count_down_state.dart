import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final advanceTurnTriggerProvider = StateProvider<int>((ref) => 0);


class CountdownModel {
  final int remaining;
  final bool isRunning;

  const CountdownModel({required this.remaining, required this.isRunning});

  CountdownModel copyWith({int? remaining, bool? isRunning}) => CountdownModel(
    remaining: remaining ?? this.remaining,
    isRunning: isRunning ?? this.isRunning,
  );
}

class AutoCounter extends StateNotifier<CountdownModel> {
  final int initial;
  Timer? _timer;

  AutoCounter({required this.initial})
      : super(CountdownModel(remaining: initial, isRunning: false));

  void _tick() {
    if (state.remaining > 0) {
      state = state.copyWith(remaining: state.remaining - 1);
      if (state.remaining == 0) pause();
    } else {
      pause();
    }
  }

  void start() {
    if (state.isRunning) return;
    if (state.remaining == 0) {
      state = CountdownModel(remaining: initial, isRunning: true);
    } else {
      state = state.copyWith(isRunning: true);
    }
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  void pause() {
    if (!state.isRunning) return;
    _timer?.cancel();
    state = state.copyWith(isRunning: false);
  }

  void reset() {
    _timer?.cancel();
    state = CountdownModel(remaining: initial, isRunning: false);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}


final autoCounterProvider = StateNotifierProvider.family<AutoCounter, CountdownModel, int>(
      (ref, initialSeconds) {
    return AutoCounter(initial: initialSeconds);
  },
);

class AutoCounterParams {
  final int initialSeconds;
  final void Function()? onPause;
  const AutoCounterParams({
    required this.initialSeconds,
    this.onPause,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AutoCounterParams &&
              runtimeType == other.runtimeType &&
              initialSeconds == other.initialSeconds;

  @override
  int get hashCode => initialSeconds.hashCode;
}
