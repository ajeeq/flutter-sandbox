import 'package:flutter_riverpod/flutter_riverpod.dart';

final campusNameProvider = StateNotifierProvider((_) => CampusNameNotifier());

class CampusNameNotifier extends StateNotifier<String> {
  CampusNameNotifier(): super("");

  updateSelectedCampusName(String value) {
    state = value;
  }

  clearCampusName() {
    state = "";
  }
}