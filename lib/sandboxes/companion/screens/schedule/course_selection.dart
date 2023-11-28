// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// Widgets
import 'package:flutter_sandbox/sandboxes/companion/widgets/course_input_field.dart';

class CourseSelection extends ConsumerStatefulWidget {
  const CourseSelection({Key? key}) : super(key: key);

  @override
  _CourseSelectionState createState() => _CourseSelectionState();
}

class _CourseSelectionState extends ConsumerState<CourseSelection> {
  // bool isLoading = false;
  // SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Choose your course"),
      ),
      body: Container(
        child: CourseInputField(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.navigate_next),
        label: const Text('Next'),
        onPressed: () async {
          // Navigator.pop(context);
          Navigator.pushNamed(context, '/group_selection');
        },
      ),
    );

  }
}