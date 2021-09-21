import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseListProvider = StateNotifierProvider<CourseListNotifier, List<String>>((ref) => CourseListNotifier());
final courseNameProvider = StateNotifierProvider((ref) => CourseNameNotifier());

class CourseListNotifier extends StateNotifier<List<String>> {
  CourseListNotifier() : super([]);

  updateCourseList(List<String> l) {
    state = [];
    state = l;
  }

  // final ProviderRefBase ref;

  // void increment() {
  //   // Counter can use the "ref" to read other providers
  //   final repository = ref.read(repositoryProvider);
  //   repository.post('...');
  // }
}

class CourseNameNotifier extends StateNotifier<String> {
  CourseNameNotifier(): super("");

  updateSelectedCourseName(String value) {
    state = value;
  }
}