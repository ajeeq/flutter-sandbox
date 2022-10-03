import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sandbox/models/group.dart';

final groupListProvider = StateNotifierProvider<GroupListNotifier, List<GroupElement>>((_) => GroupListNotifier());
final groupNameProvider = StateNotifierProvider((_) => GroupNameNotifier());

class GroupListNotifier extends StateNotifier<List<GroupElement>> {
  GroupListNotifier() : super([]);
  
  updateGroupList(List<GroupElement> l) {
    state = [];
    state = l;
  }
}

class GroupNameNotifier extends StateNotifier<String> {
  GroupNameNotifier(): super("");

  updateSelectedGroupName(String value) {
    state = value;
  }
}