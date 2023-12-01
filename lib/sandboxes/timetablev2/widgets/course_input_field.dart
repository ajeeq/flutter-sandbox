// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

// API Services
import 'package:flutter_sandbox/api/servicestwo.dart';

// Models
import 'package:flutter_sandbox/models/course.dart';
import 'package:flutter_sandbox/models/group.dart';

// Providers and Hive
import 'package:flutter_sandbox/providers/campus_providers.dart';
import 'package:flutter_sandbox/providers/course_providers.dart';
import 'package:flutter_sandbox/providers/group_providers.dart';

class CourseInputField extends ConsumerStatefulWidget {
  const CourseInputField({Key? key}) : super(key: key);

  @override
  _CourseInputFieldState createState() => _CourseInputFieldState();
}

class _CourseInputFieldState extends ConsumerState<CourseInputField> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  String? _selectedSaveCourse;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // declaring riverpod state providers
    final List<CourseElement> courseListState = ref.watch(courseListProvider);
    final campusNameState = ref.watch(campusNameProvider);
    final facultyNameState = ref.watch(facultyNameProvider);

    // declaring notifiers for updating riverpod states
    final CourseNameNotifier courseNameController = ref.read(courseNameProvider.notifier);
    final CourseUrlNotifier courseUrlController = ref.read(courseUrlProvider.notifier);
    final GroupListNotifier groupListController = ref.read(groupListProvider.notifier);

    return GestureDetector(
      // close the suggestions box when the user taps outside of it
      onTap: () {
        suggestionBoxController.close();
      },
      child: Container(
        // Add zero opacity to make the gesture detector work
        color: Colors.amber.withOpacity(0),
        // Create the form for the user
        child: Form(
          key: this._formKey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '3. Course',
                  style: TextStyle(
                    fontFamily: 'avenir',
                    fontSize: 32,
                    fontWeight: FontWeight.w900),
                ),
                
                TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () => this._typeAheadController.clear(),
                        icon: const Icon(Icons.clear),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.grey[300]!),
                      ),
                      hintText: 'Search course here',
                    ),
                    controller: this._typeAheadController,
                  ),
                  suggestionsCallback: (pattern) {
                    Iterable<String> items = courseListState.map((e) => (e.course));
                    return items.where((e) => e.toLowerCase().contains(pattern.toLowerCase())).toList();
                  },
                  itemBuilder: (context, String suggestion) {
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  noItemsFoundBuilder: (context) => Container(
                    height: 70,
                    child: Center(
                      child: Text(
                        'No course found.',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  onSuggestionSelected: (String suggestion) {
                    this._typeAheadController.text = suggestion;
                    // bool found = false;
                    var url = '';

                    for (var obj in courseListState) {
                      if (obj.course == suggestion) {
                        url = obj.url;
                        // found = true;
                        break;
                      }
                      // print(jsonEncode(obj));
                    }
                      // updating selected course name and course url in state(riverpod)
                      courseNameController.updateSelectedCourseName(suggestion.toString());
                      courseUrlController.updateCourseUrl(url);
                      print(suggestion + ", " + url);

                    // NOTE: course name is from suggestion above
                    // NOTE: campus name is campusNameState in provider declared above
                
                    // ServicesTwo.getGroup(campusNameState, facultyNameState, suggestion).then((groups) {
                    //   final List<GroupElement> jsonStringData = groups.groups;

                    //   // updating group list state
                    //   groupListController.updateGroupList(jsonStringData);
                    // });

                  },
                  suggestionsBoxController: suggestionBoxController,
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    elevation: 8.0,
                    color: Theme.of(context).cardColor,
                  ),
                  autoFlipDirection: true,
                  autoFlipListDirection: true,
                  validator: (value) => value!.isEmpty ? 'Please select a campus' : null,
                  onSaved: (value) => this._selectedSaveCourse = value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}