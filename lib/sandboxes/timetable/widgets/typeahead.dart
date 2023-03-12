import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_sandbox/models/campus_faculty.dart';
import 'package:flutter_sandbox/api/servicestwo.dart';

class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  String? _selectedCity;

  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  bool isLoading = false;
  List<CampusElement> _campuses = [];
  List<FacultyElement> _faculties = [];

  @override
  void initState() {
    super.initState();

    isLoading = true;

    ServicesTwo.getCampusesFaculties().then((campuses) {
      final List<CampusElement> jsonStringCampusList = campuses.campuses;
      final List<FacultyElement> jsonStringFacultyList = campuses.faculties;
      // if(_campuses == null)

      setState(() {
        _campuses = jsonStringCampusList;
        _faculties = jsonStringFacultyList;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // close the suggestions box when the user taps outside of it
      onTap: () {
        suggestionBoxController.close();
      },
      child: Container(
        // Add zero opacity to make the gesture detector work
        color: Colors.amber.withOpacity(0),
        // Create the form for the user to enter their favorite city
        child: Form(
          key: this._formKey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '4. flutter_typeahead?',
                  style: TextStyle(
                    fontFamily: 'avenir',
                    fontSize: 32,
                    fontWeight: FontWeight.w900),
                ),
                
                TypeAheadFormField(
                  autoFlipDirection: true,
                  autoFlipListDirection: true,
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
                      hintText: 'Search TypeAheadFormField',
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
                        'No Campus Found.',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  onSuggestionSelected: (String suggestion) {
                    this._typeAheadController.text = suggestion;
                  },
                  suggestionsBoxController: suggestionBoxController,
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    elevation: 8.0,
                    color: Theme.of(context).cardColor,
                  ),
                  validator: (value) => value!.isEmpty ? 'Please select a city' : null,
                  onSaved: (value) => this._selectedCity = value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}