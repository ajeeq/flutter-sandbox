// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// Services
import 'package:flutter_sandbox/api/simsweb4.dart';

// Widgets
import 'package:flutter_sandbox/sandboxes/timetablev2/widgets/faculty_input_field.dart';

// Models
import 'package:flutter_sandbox/models/cam_fac.dart';
import 'package:flutter_sandbox/models/course.dart';

// Providers and Hive
import 'package:flutter_sandbox/providers/campus_providers.dart';
import 'package:flutter_sandbox/providers/course_providers.dart';

class FacultySelection extends ConsumerStatefulWidget {
  const FacultySelection({Key? key}) : super(key: key);

  @override
  _FacultySelectionState createState() => _FacultySelectionState();
}

class _FacultySelectionState extends ConsumerState<FacultySelection> {
  // bool isLoading = false;
  // SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  @override
  Widget build(BuildContext context) {
    final CourseListNotifier courseListController = ref.read(courseListProvider.notifier);
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final faculties = args['faculties'] as List<Result>;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Choose your faculty"),
      ),
      body: Container(
        child: FacultyInputField(faculties: faculties),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.navigate_next),
        label: const Text('Next'),
        onPressed: () async {
          // declaring riverpod state providers
          final campusNameState = ref.watch(campusNameProvider);
          final facultyNameState = ref.watch(facultyNameProvider);
          
          // var campusCode = campusNameState.toString().split(" -")[0].trim();
          // var campusCode = '';

          SimsWeb4.getCourses(campusNameState, facultyNameState).then((courses) {
            final List<CourseElement> jsonStringData = courses.courses;

            // updating course list state using Riverpod
            courseListController.updateCourseList(jsonStringData);
          });

          Navigator.pushNamed(context, '/course_selection');
        },
      ),
    );

  }
}