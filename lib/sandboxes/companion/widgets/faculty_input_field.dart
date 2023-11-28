// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

// API Services
import 'package:flutter_sandbox/api/servicestwo.dart';

// Models
import 'package:flutter_sandbox/models/campus_faculty.dart';
import 'package:flutter_sandbox/models/course.dart';

// Providers and Hive
import 'package:flutter_sandbox/providers/campus_providers.dart';
import 'package:flutter_sandbox/providers/course_providers.dart';

class FacultyInputField extends ConsumerStatefulWidget {
  const FacultyInputField({Key? key}) : super(key: key);

  @override
  _FacultyInputFieldState createState() => _FacultyInputFieldState();
}

class _FacultyInputFieldState extends ConsumerState<FacultyInputField> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  String? _selectedSaveFaculty;

  bool isLoading = false;
  List<FacultyElement> _faculties = [];

  // late String _selectedCampus;
  late String _selectedFaculty;

  @override
  void initState() {
    super.initState();

    isLoading = true;

    ServicesTwo.getCampusesFaculties().then((campuses) {
      final List<FacultyElement> jsonStringFacultyList = campuses.faculties;

      setState(() {
        _faculties = jsonStringFacultyList;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // declaring riverpod state providers
    final List<CourseElement> courseListState = ref.watch(courseListProvider);
    final campusNameState = ref.watch(campusNameProvider);

    // declaring notifiers for updating riverpod states
    final FacultyNameNotifier facultyController = ref.read(facultyNameProvider.notifier);
    final CourseListNotifier courseListController = ref.read(courseListProvider.notifier);
    
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
                  '2. Faculty',
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
                      hintText: 'Search faculty here',
                    ),
                    controller: this._typeAheadController,
                  ),
                  suggestionsCallback: (pattern) {
                    Iterable<String> items = _faculties.map((e) => (e.faculty));
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
                        'No faculty found.',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  onSuggestionSelected: (String suggestion) {
                    this._typeAheadController.text = suggestion;

                    _selectedFaculty = suggestion;
                    // _selectedCampus = campusNameState;

                    // updating selected faculty name in state(riverpod)
                    facultyController.updateSelectedFacultyName(_selectedFaculty);

                    ServicesTwo.getCourses(campusNameState, suggestion).then((courses) {
                      final List<CourseElement> jsonStringData = courses.courses;

                      // updating course list state using Riverpod
                      courseListController.updateCourseList(jsonStringData);
                    });
                  },
                  suggestionsBoxController: suggestionBoxController,
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    elevation: 8.0,
                    color: Theme.of(context).cardColor,
                  ),
                  autoFlipDirection: true,
                  autoFlipListDirection: true,
                  validator: (value) => value!.isEmpty ? 'Please select a faculty' : null,
                  onSaved: (value) => this._selectedSaveFaculty = value,
                ),

                SizedBox(height: 4),
                
                Text(
                  "Skip this and hit Next button if you are not UiTM Shah Alam student.",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}