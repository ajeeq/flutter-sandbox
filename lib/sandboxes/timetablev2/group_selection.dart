// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// Widgets
import 'package:flutter_sandbox/sandboxes/timetablev2/widgets/group_input_field.dart';

// Models
import 'package:flutter_sandbox/models/selected.dart';

// Providers and Hive
import 'package:flutter_sandbox/providers/campus_providers.dart';
import 'package:flutter_sandbox/providers/course_providers.dart';
import 'package:flutter_sandbox/providers/group_providers.dart';
import 'package:flutter_sandbox/sandboxes/timetable/utils/hive_selected_course.dart';

class GroupSelection extends ConsumerStatefulWidget {
  const GroupSelection({Key? key}) : super(key: key);

  @override
  _GroupSelectionState createState() => _GroupSelectionState();
}

class _GroupSelectionState extends ConsumerState<GroupSelection> {
  // bool isLoading = false;
  // SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();
  final HiveSelectedCourse dataStore = HiveSelectedCourse();

  @override
  Widget build(BuildContext context) {
    // declaring riverpod state providers
    final campusNameState = ref.watch(campusNameProvider);
    final courseNameState = ref.watch(courseNameProvider);
    final courseUrlState = ref.watch(courseUrlProvider);
    final facultyNameState = ref.watch(facultyNameProvider);
    final groupNameState = ref.watch(groupNameProvider);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Choose your group"),
      ),
      body: Container(
        child: GroupInputField(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.done),
        label: const Text('Done'),
        onPressed: () async {
          final selection = Selected(
            campusSelected: campusNameState.toString(),
            courseSelected: courseNameState.toString(),
            courseUrlSelected: courseUrlState.toString(),
            facultySelected: facultyNameState.toString(),
            groupSelected: groupNameState.toString()
          );
          dataStore.addSelected(selectedModel: selection);

          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
      ),
    );

  }
}