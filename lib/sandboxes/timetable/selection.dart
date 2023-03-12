// Import directives
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

// Widgets
import 'package:flutter_sandbox/sandboxes/timetable/widgets/campus_input_field.dart';
import 'package:flutter_sandbox/sandboxes/timetable/widgets/faculty_input_field.dart';
import 'package:flutter_sandbox/sandboxes/timetable/widgets/course_input_field.dart';
import 'package:flutter_sandbox/sandboxes/timetable/widgets/group_input_field.dart';
// import 'package:flutter_sandbox/sandboxes/timetable/widgets/course_autocomplete.dart';
// import 'package:flutter_sandbox/sandboxes/timetable/widgets/group_autocomplete.dart';
// import 'package:flutter_sandbox/sandboxes/timetable/widgets/typeahead.dart';

// API Services
import 'package:flutter_sandbox/api/services.dart';
import 'package:flutter_sandbox/api/servicestwo.dart';

// Models
import 'package:flutter_sandbox/models/campus_faculty.dart';
import 'package:flutter_sandbox/models/course.dart';
import 'package:flutter_sandbox/models/selected.dart';

// Providers and Hive
import 'package:flutter_sandbox/providers/campus_providers.dart';
import 'package:flutter_sandbox/providers/course_providers.dart';
import 'package:flutter_sandbox/providers/group_providers.dart';
import 'package:flutter_sandbox/providers/selected_providers.dart';
import 'package:flutter_sandbox/sandboxes/timetable/utils/hive_selected_course.dart';



class Selection extends ConsumerStatefulWidget {
  const Selection({Key? key}) : super(key: key);

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends ConsumerState<Selection> {
  bool isLoading = false;
  bool isExist = false;
  late TextEditingController controller;
  final TextEditingController _typeAheadController = TextEditingController();
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();
  final HiveSelectedCourse dataStore = HiveSelectedCourse();

  // List<CampusElement> _campuses = [];
  // List<FacultyElement> _faculties = [];

  // late String _selectedCampus;
  // late String _selectedFaculty;

  // @override
  // void initState() {
  //   super.initState();

  //   isLoading = true;

  //   ServicesTwo.getCampusesFaculties().then((campuses) {
  //     final List<CampusElement> jsonStringCampusList = campuses.campuses;
  //     final List<FacultyElement> jsonStringFacultyList = campuses.faculties;
  //     // if(_campuses == null)

  //     setState(() {
  //       _campuses = jsonStringCampusList;
  //       _faculties = jsonStringFacultyList;
  //       isLoading = false;
  //     });
  //   });
  // }

  

  @override
  Widget build(BuildContext context) {
    // declaring riverpod state providers
    final campusNameState = ref.watch(campusNameProvider);
    final courseNameState = ref.watch(courseNameProvider);
    final facultyNameState = ref.watch(facultyNameProvider);
    final groupNameState = ref.watch(groupNameProvider);
    final selectedListState = ref.watch(selectedListProvider);

    // declaring notifiers for updating riverpod states
    final CampusNameNotifier campusController = ref.read(campusNameProvider.notifier);
    final FacultyNameNotifier facultyController = ref.read(facultyNameProvider.notifier);
    final CourseListNotifier courseListController = ref.read(courseListProvider.notifier);
    final SelectedListNotifier selectedListController = ref.read(selectedListProvider.notifier);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add Course"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GestureDetector(
              onTap: () => {
                suggestionBoxController.close(),
                FocusScope.of(context).unfocus()
              },
              child: SingleChildScrollView(
                reverse: true,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    // =================== //
                    // CAMPUS AUTOCOMPLETE //
                    // =================== //
                    CampusInputField(),

                    // ==================== //
                    // FACULTY AUTOCOMPLETE //
                    // ==================== //
                    FacultyInputField(),

                    // =================== //
                    // COURSE AUTOCOMPLETE //
                    // =================== //
                    CourseInputField(),

                    // ================== //
                    // GROUP AUTOCOMPLETE //
                    // ================== //
                    GroupInputField()
                  ],
                ),
              ),
            ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.done),
        label: const Text('Done'),
        onPressed: () async {
          // adding user course selection using Riverpod
          // selectedListController.addSelected(Selected(
          //     campusSelected: _selectedCampus,
          //     courseSelected: courseNameState.toString(),
          //     facultySelected: facultyNameState.toString(),
          //     groupSelected: groupNameState.toString()
          //   ));

          final selection = Selected(
            campusSelected: campusNameState.toString(),
            courseSelected: courseNameState.toString(),
            facultySelected: facultyNameState.toString(),
            groupSelected: groupNameState.toString()
          );
          dataStore.addSelected(selectedModel: selection);

          Navigator.pop(context);
        },
      ),
    );

  }
}