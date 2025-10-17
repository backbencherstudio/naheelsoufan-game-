import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/riverpod/function.dart';

final pageIndexProvider =
StateNotifierProvider<PageNavigationNotifier, int>((ref) {
  return PageNavigationNotifier(ref);
});

class PageNavigationNotifier extends StateNotifier<int> {
  PageNavigationNotifier(this.ref) : super(0); // default to page 0

  final Ref ref;

  void nextPage(PageController controller, int maxPages) {
    if (state < maxPages - 1) {
      state++;
      controller.animateToPage(
        state,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage(PageController controller) {
    if (state > 0) {
      state--;
      controller.animateToPage(
        state,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    // Optional toggle state (like isBanishButton)
    final toggle = ref.read(isBanishButtonProvider.notifier);
    toggle.state = !toggle.state;
  }

  void setPage(int index) {
    state = index;
  }
}
