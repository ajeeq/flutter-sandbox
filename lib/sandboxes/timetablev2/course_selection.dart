// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// Services
import 'package:flutter_sandbox/api/simsweb4.dart';

// Widgets
import 'package:flutter_sandbox/sandboxes/timetablev2/widgets/course_input_field.dart';

// Models
import 'package:flutter_sandbox/models/group.dart';

// Providers
import 'package:flutter_sandbox/providers/course_providers.dart';
import 'package:flutter_sandbox/providers/group_providers.dart';

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
    final GroupListNotifier groupListController = ref.read(groupListProvider.notifier);

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
          // declaring riverpod state providers
          final courseUrlState = ref.watch(courseUrlProvider);

          SimsWeb4.getGroup(courseUrlState).then((groups) {
            final List<GroupElement> jsonStringData = groups.groups;

            // updating group list state
            groupListController.updateGroupList(jsonStringData);
          });

          Navigator.pushNamed(context, '/group_selection');
          
        },
      ),
    );

  }
}