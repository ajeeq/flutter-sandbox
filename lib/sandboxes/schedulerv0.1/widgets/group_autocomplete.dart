// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:substring_highlight/substring_highlight.dart';

// Providers
import 'package:sandbox_riverpod/providers/group_providers.dart';

// TODO: Please change to ConsumerStatefulWidget
// TODO: Rename notifiers object to controller
class GroupAutocomplete extends ConsumerStatefulWidget {
  @override
  _GroupAutocompleteState createState() => _GroupAutocompleteState();
}

class _GroupAutocompleteState extends ConsumerState<GroupAutocomplete> {
  late TextEditingController controller;
  
  @override
  Widget build(BuildContext context) {
    // declaring riverpod state providers
    final groupListState = ref.watch(groupListProvider);

    // declaring notifiers for updating riverpod states
    final GroupNameNotifier groupNameN = ref.read(groupNameProvider.notifier);

    return Autocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        } else {
          return groupListState.where((word) => word
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
      onSelected: (selectedString) {
        // updating selected group name in state(riverpod)
        groupNameN.updateSelectedGroupName(selectedString.toString());
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
            hintText: "Search group/class here",
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
}

  