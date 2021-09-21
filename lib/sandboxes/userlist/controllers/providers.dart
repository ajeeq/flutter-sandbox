import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox_riverpod/sandboxes/userlist/api/cheetah_api.dart';
import 'package:sandbox_riverpod/sandboxes/userlist/controllers/UserListController.dart';
// import 'package:sandbox_riverpod/sandboxes/userlist/model/user.dart';

// Provider = unchanged state = global constant
final titleNameProvider = Provider<String>((ref) {
  return "Riverpod User List";
});

final profileNameProvider = FutureProvider<String>((ref) async {
  return getProfileUserName();
});

final sessionTimeProvider = StreamProvider<int>((ref) {
  return getSessionTime();
});

// final userListProvider = StateNotifierProvider<UserList, List<User>>((ref) {
//   return UserList();
// });

// final userListProvider = StateNotifierProvider((ref) {
//   return UserList();
// });

final countryProvider = FutureProvider.autoDispose<String>((ref) async {
  String response = await getCountry();

  if (response == "not found") {
    ref.maintainState = false;
  }
  else {
    ref.maintainState = true; // no auto dispose, state maintained and api is not called again
  }

  String country = response;
  
  return country;
});

final userListProvider = StateNotifierProvider(
  (_) => UserListController(),
);