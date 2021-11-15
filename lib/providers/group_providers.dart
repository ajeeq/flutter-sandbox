import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox_riverpod/models/group.dart';

final groupListProvider = StateNotifierProvider<GroupListNotifier, List<GroupArray>>((_) => GroupListNotifier());
final groupNameProvider = StateNotifierProvider((_) => GroupNameNotifier());

class GroupListNotifier extends StateNotifier<List<GroupArray>> {
  GroupListNotifier() : super([]);
  
  updateGroupList(List<GroupArray> l) {
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