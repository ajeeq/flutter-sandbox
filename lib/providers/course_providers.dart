import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sandbox/models/course.dart';

final courseListProvider = StateNotifierProvider<CourseListNotifier, List<CourseElement>>((ref) => CourseListNotifier());
final courseNameProvider = StateNotifierProvider((ref) => CourseNameNotifier());

class CourseListNotifier extends StateNotifier<List<CourseElement>> {
  CourseListNotifier() : super([]);

  updateCourseList(List<CourseElement> l) {
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