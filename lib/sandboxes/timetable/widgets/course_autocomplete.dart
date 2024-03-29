// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:substring_highlight/substring_highlight.dart';

// API Services
import 'package:flutter_sandbox/api/services.dart';
import 'package:flutter_sandbox/api/servicestwo.dart';

// Models
import 'package:flutter_sandbox/models/course.dart';
import 'package:flutter_sandbox/models/group.dart';

// Providers
import 'package:flutter_sandbox/providers/campus_providers.dart';
import 'package:flutter_sandbox/providers/course_providers.dart';
import 'package:flutter_sandbox/providers/group_providers.dart';


class CourseAutocomplete extends ConsumerStatefulWidget {
  const CourseAutocomplete({Key? key}) : super(key: key);

  @override
  _CourseAutocompleteState createState() => _CourseAutocompleteState();
}

class _CourseAutocompleteState extends ConsumerState<CourseAutocomplete> {
  late TextEditingController controller;
  
  @override
  Widget build(BuildContext context) {
    // declaring riverpod state providers
    final List<CourseElement> courseListState = ref.watch(courseListProvider);
    final campusNameState = ref.watch(campusNameProvider);
    final facultyNameState = ref.watch(facultyNameProvider);

    // declaring notifiers for updating riverpod states
    final CourseNameNotifier courseNameController = ref.read(courseNameProvider.notifier);
    final GroupListNotifier groupListController = ref.read(groupListProvider.notifier);

    return Autocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        } else {
          // reading course list state
          return courseListState.map((e) => e.course).where((word) => word
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase()));
        }
      },
      optionsViewBuilder: (context, Function(String) onSelected, options) {
        return Material(
          elevation: 4,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final option = options.elementAt(index);
  
              return ListTile(
                title: SubstringHighlight(
                  text: option.toString(),
                  term: controller.text,
                  textStyleHighlight: const TextStyle(fontWeight: FontWeight.w700),
                ),
                onTap: () {
                  onSelected(option.toString());
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: options.length,
          ),
        );
      },
      onSelected: (selectedString) async {
        // updating selected course name in state(riverpod)
        courseNameController.updateSelectedCourseName(selectedString.toString());

        // NOTE: course name is from selectedString above
        // NOTE: campus name is campusNameState in provider declared above
    
        ServicesTwo.getGroup(campusNameState, facultyNameState, selectedString).then((groups) {
          final List<GroupElement> jsonStringData = groups.groups;

          // updating group list state
          groupListController.updateGroupList(jsonStringData);
        });
      },
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        this.controller = controller;
  
        return TextField(
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            hintText: "Search course here",
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              onPressed: () => controller.clear(), 
              icon: const Icon(Icons.clear)
            )
          ),
        );
      },
    );
  }
}

  