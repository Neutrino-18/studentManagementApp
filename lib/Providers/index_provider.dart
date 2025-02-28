import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexProvider = StateProvider<int>((ref) => 0);
final historyProvider = StateNotifierProvider<HistoryIndexNotifier, List<int>>(
    (ref) => HistoryIndexNotifier());

class HistoryIndexNotifier extends StateNotifier<List<int>> {
  HistoryIndexNotifier() : super([0]);

  void updateIndex(int index, WidgetRef ref) {
    if (index != ref.read(indexProvider)) {
      ref.read(indexProvider.notifier).state = index;
      state = [...state, index];
    }
  }

  bool onPopInvoked(WidgetRef ref) {
    if (state.last == 0) {
      state = [0];
    }
    if (state.length > 1) {
      state = state.sublist(0, state.length - 1);
      ref.read(indexProvider.notifier).state = state.last;
      return false;
    }
    return true;
  }
}
