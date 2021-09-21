import 'package:flutter_riverpod/flutter_riverpod.dart';

final groupListProvider = StateNotifierProvider<GroupListNotifier, List<String>>((_) => GroupListNotifier());
final groupNameProvider = StateNotifierProvider((_) => GroupNameNotifier());

class GroupListNotifier extends StateNotifier<List<String>> {
  GroupListNotifier() : super([]);
  
  updateGroupList(List<String> l) {
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