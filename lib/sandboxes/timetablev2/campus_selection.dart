// Import directives
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// Services
import 'package:flutter_sandbox/api/simsweb4.dart';

// Widgets
import 'package:flutter_sandbox/sandboxes/timetablev2/widgets/campus_input_field.dart';

// Models
import 'package:flutter_sandbox/models/cam_fac.dart';

// Providers
import 'package:flutter_sandbox/providers/campus_providers.dart';

class CampusSelection extends ConsumerStatefulWidget {
  const CampusSelection({Key? key}) : super(key: key);

  @override
  _CampusSelectionState createState() => _CampusSelectionState();
}

class _CampusSelectionState extends ConsumerState<CampusSelection> {
  // bool _isLoading = false;
  // SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();
   String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final campuses = args['campuses'] as List<Result>;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Choose your campus"),
      ),
      body: Container(
        child: CampusInputField(campuses: campuses),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.navigate_next),
        label: const Text('Next'),
        onPressed: () async {
          SimsWeb4.getFaculties().then((data) {
            if(data.results.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("No data available from the iCRESS at the moment😐"),
                  duration: Duration(seconds: 5),
                ),
              );
            } else {
              // print(jsonEncode(data.results));
              Navigator.pushNamed(context, '/faculty_selection', arguments: {
                'faculties': data.results
              });
            }
          }).catchError((e) {
              setState(() {
                _errorMessage = e.toString();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_errorMessage),
                  duration: const Duration(seconds: 5),
                ),
              );
          });
        },
      ),
    );

  }
}