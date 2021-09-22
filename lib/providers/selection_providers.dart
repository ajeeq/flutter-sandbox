import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model
import 'package:sandbox_riverpod/models/selection_parameter.dart';

final selectionListProvider = StateNotifierProvider<SelectionListNotifier, List<SelectionParameter>>((_) => SelectionListNotifier());

class SelectionListNotifier extends StateNotifier<List<SelectionParameter>> {
  SelectionListNotifier() : super([]);

  addSelection(SelectionParameter sp) {
    state = [...state, sp]; // previous state + new added user object
  }

  deleteSelection(SelectionParameter sp) {
    state = state.where((_selection) => _selection.courseSelected != sp.courseSelected).toList();
  }

}