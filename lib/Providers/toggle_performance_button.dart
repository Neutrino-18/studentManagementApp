import 'package:flutter_riverpod/flutter_riverpod.dart';

class PerformanceNotifier extends StateNotifier<Map<int, bool>> {
  PerformanceNotifier() : super({});

  void toggle(int index) {
    state = {...state, index: !(state[index] ?? false)};
  }
}

final performButProvider =
    StateNotifierProvider<PerformanceNotifier, Map<int, bool>>(
        (ref) => PerformanceNotifier());
