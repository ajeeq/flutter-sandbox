import 'package:flutter_riverpod/flutter_riverpod.dart';

final campusNameProvider = StateNotifierProvider((_) => CampusNameNotifier());
final facultyNameProvider = StateNotifierProvider((_) => FacultyNameNotifier());

class CampusNameNotifier extends StateNotifier<String> {
  CampusNameNotifier() : super("");

  updateSelectedCampusName(String value) {
    state = value;
  }

  clearCampusName() {
    state = "";
  }
}

class FacultyNameNotifier extends StateNotifier<String> {
  FacultyNameNotifier() : super("");

  updateSelectedFacultyName(String value) {
    state = value;
  }

  clearFacultyName() {
    state = "";
  }
}