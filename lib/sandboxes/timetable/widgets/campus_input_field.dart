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

class CampusInputField extends ConsumerStatefulWidget {
  const CampusInputField({Key? key}) : super(key: key);

  @override
  _CampusInputFieldState createState() => _CampusInputFieldState();
}

class _CampusInputFieldState extends ConsumerState<CampusInputField> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  String? _selectedSaveCampus;

  bool isLoading = false;
  List<CampusElement> _campuses = [];
  List<FacultyElement> _faculties = [];

  late String _selectedCampus;
  late String _selectedFaculty;

  @override
  void initState() {
    super.initState();

    isLoading = true;

    ServicesTwo.getCampusesFaculties().then((campuses) {
      final List<CampusElement> jsonStringCampusList = campuses.campuses;
      final List<FacultyElement> jsonStringFacultyList = campuses.faculties;

      setState(() {
        _campuses = jsonStringCampusList;
        _faculties = jsonStringFacultyList;
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _typeAheadController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // declaring notifiers for updating riverpod states
    final CampusNameNotifier campusController = ref.read(campusNameProvider.notifier);
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
                  '1. Campus',
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
                      hintText: 'Search campus here',
                    ),
                    controller: this._typeAheadController,
                  ),
                  suggestionsCallback: (pattern) {
                    Iterable<String> items = _campuses.map((e) => (e.campus));
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
                        'No campus Found.',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  onSuggestionSelected: (String suggestion) {
                    this._typeAheadController.text = suggestion;

                    _selectedCampus = suggestion;
                    campusController.updateSelectedCampusName(_selectedCampus);

                    ServicesTwo.getCourses(suggestion, "").then((courses) {
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
                  validator: (value) => value!.isEmpty ? 'Please select a campus' : null,
                  onSaved: (value) => this._selectedSaveCampus = value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}