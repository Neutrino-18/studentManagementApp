import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexProvider = StateProvider<int>((ref) => 0);
final historyProvider = StateNotifierProvider<HistoryIndexNotifier, List<int>>(
    (ref) => HistoryIndexNotifier(ref));

class HistoryIndexNotifier extends StateNotifier<List<int>> {
  final Ref ref;
  HistoryIndexNotifier(this.ref) : super([0]);

  void updateIndex(int index) {
    if (index != ref.read(indexProvider)) {
      state = [...state, index];
      ref.read(indexProvider.notifier).state = index;
    }

    if (index == 0) {
      state = [0];
    }
  }

  bool onPopInvoked() {
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
