import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexNotifier extends StateNotifier<int> {
  IndexNotifier() : super(0);

  void changeIndex(int index) {
    state = state + index;
  }
}

final indexProvider =
    StateNotifierProvider<IndexNotifier, int>((ref) => IndexNotifier());
