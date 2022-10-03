import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model
import 'package:flutter_sandbox/models/selected.dart';

final selectedListProvider = StateNotifierProvider<SelectedListNotifier, List<Selected>>((_) => SelectedListNotifier());

class SelectedListNotifier extends StateNotifier<List<Selected>> {
  SelectedListNotifier() : super([]);

  addSelected(Selected sp) {
    state = [...state, sp]; // previous state + new added user object
  }

  deleteSelected(Selected sp) {
    state = state.where((_selected) => _selected.courseSelected != sp.courseSelected).toList();
  }

  updateSelected(List<Selected> sp) {
    state = sp;
  }

  getSelected() {
    return state;
  }

}