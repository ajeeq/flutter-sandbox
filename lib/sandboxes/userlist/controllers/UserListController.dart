import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox_riverpod/sandboxes/userlist/model/user.dart';

// StateNotifier - 1 type state
class UserListController extends StateNotifier<List<User>> {
  UserListController() : super([]); // initial userlist state

  addUser(User user) {
    state = [...state, user]; // previous state + new added user object
  }

  // A value of type 'Iterable<User>' can't be assigned to a variable of type 'List<User>'
  // Solution = add .toList();
  deleteUser(User user) {
    state = state.where((_user) => _user.name != user.name).toList();
  }

}