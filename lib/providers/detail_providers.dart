import 'package:flutter_riverpod/flutter_riverpod.dart';

// Models
import 'package:flutter_sandbox/models/detail.dart';

final detailListProvider = StateNotifierProvider<DetailListNotifier, List<DetailElement>>((ref) => DetailListNotifier());

class DetailListNotifier extends StateNotifier<List<DetailElement>> {
  DetailListNotifier() : super([]);

  updateDetailList(List<DetailElement> l) {
    state = [];
    state = l;
  }
}