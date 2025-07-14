import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollPositionNotifier extends StateNotifier<double> {
  ScrollPositionNotifier() : super(0.0);

  // Update the scroll position
  void updateScrollPosition(double position) {
    state = position;
  }
}
final scrollPositionProvider = StateNotifierProvider<ScrollPositionNotifier, double>((ref) {
  return ScrollPositionNotifier();
});
