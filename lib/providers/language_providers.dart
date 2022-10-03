import 'package:flutter_riverpod/flutter_riverpod.dart';

// Models
import 'package:flutter_sandbox/models/mandarin.dart';

final inputWordProvider = StateNotifierProvider((_) => InputWordNotifier());
final mandarinListProvider = StateNotifierProvider<MandarinListNotifier, List<Mandarin>>((ref) => MandarinListNotifier());

class InputWordNotifier extends StateNotifier<String> {
  InputWordNotifier() : super("");

  updateInputWord(String value) {
    state = value;
  }

  clearInputWord() {
    state = "";
  }
}

class MandarinListNotifier extends StateNotifier<List<Mandarin>> {
  MandarinListNotifier() : super([]);

  updateDetailList(List<Mandarin> l) {
    state = [];
    state = l;
  }
}