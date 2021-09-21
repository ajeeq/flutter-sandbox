// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:substring_highlight/substring_highlight.dart';

// API Services
import 'package:sandbox_riverpod/services.dart';

// Models
import 'package:sandbox_riverpod/models/group.dart';

// Providers
import 'package:sandbox_riverpod/providers/campus_providers.dart';
import 'package:sandbox_riverpod/providers/course_providers.dart';
import 'package:sandbox_riverpod/providers/group_providers.dart';

// TODO: Please change to ConsumerStatefulWidget
// TODO: Rename notifiers object to controller
class CourseAutocomplete extends StatefulWidget {
  @override
  _CourseAutocompleteState createState() => _CourseAutocompleteState();
}

class _CourseAutocompleteState extends State<CourseAutocomplete> {
  late TextEditingController controller;
  
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, WidgetRef ref, child) {
        // declaring riverpod state providers
        final List<String> courseListState = ref.watch(courseListProvider);
        final campusNameState = ref.watch(campusNameProvider);

         // declaring notifiers for updating riverpod states
        final CourseNameNotifier courseNameN = ref.read(courseNameProvider.notifier);
        final GroupListNotifier groupListN = ref.read(groupListProvider.notifier);

        print("courseListState: " + courseListState.toString());

        return Autocomplete(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            } else {
              // reading course list state
              return courseListState.where((word) => word
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
                      textStyleHighlight: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    onTap: () {
                      onSelected(option.toString());
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: options.length,
              ),
            );
          },
          onSelected: (selectedString) async {
            // updating selected course name in state(riverpod)
            courseNameN.updateSelectedCourseName(selectedString.toString());

            // NOTE: course name is from selectedString above
            // NOTE: campus name is campusNameState in provider declared above
      
            print("==================================");
            print("Provider-campusName: " + campusNameState);
            print("Provider-courseName: " + selectedString.toString());
            print("==================================");
        
            Services.getGroup(campusNameState, selectedString).then((groups) {
              final List<GroupArray> jsonStringData = groups;
        
              List<String> l = [];
              for(int i=0; i<jsonStringData.length; i++)
                jsonStringData.forEach((e) => l.add(e.group));
        
              print("==================================");
              print(l);
              print("==================================");

              // updating group list state
              groupListN.updateGroupList(l);
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
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () => controller.clear(), 
                  icon: Icon(Icons.clear)
                )
              ),
            );
          },
        );

      }
    );
  }
}

  