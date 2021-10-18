/// Resources: Cheetah Coding Youtube Channel

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sandbox_riverpod/sandboxes/userlist/controllers/providers.dart';
import 'package:sandbox_riverpod/sandboxes/userlist/controllers/UserListController.dart';
import 'package:sandbox_riverpod/sandboxes/userlist/model/user.dart';
import 'package:sandbox_riverpod/sandboxes/userlist/screens/user_list_screen.dart';
import 'package:sandbox_riverpod/sandboxes/userlist/widget/cheetah_button.dart';
import 'package:sandbox_riverpod/sandboxes/userlist/widget/cheetah_input.dart';
import 'package:sandbox_riverpod/sandboxes/userlist/widget/user_list.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String? _name;
  String? _city;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("Home rebuilding...");

    return Consumer(
      builder: (context, WidgetRef ref, child) {
        AsyncValue<String> name = ref.watch(profileNameProvider);
        // AsyncValue<int> time = ref.watch(sessionTimeProvider);
        final UserListController controller = ref.read(userListProvider.notifier); // ref.read = read notifier


        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            // title: name.when(
            //         data: (name) => Text(
            //           name,
            //           style: TextStyle(color: Colors.white),
            //         ),
            //         loading: () => Text(
            //           "Loading...",
            //           style: TextStyle(color: Colors.white),
            //         ),
            //         error: (e, stackTrace) => Text("Error!!!"),
            //       ),
            // leading: Center(
            //   child: time.when(
            //           data: (value) => Text(
            //             value.toString(),
            //             style: TextStyle(fontSize: 22),
            //           ),
            //           loading: () => Text("?"),
            //           error: (e, trace) => Text("error"),
            //         )
            //       ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    ref.read(titleNameProvider),
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 16),
                  CheetahInput(
                    labelText: 'Name',
                    onSaved: (String? value) {
                      _name = value;
                    },
                  ),
                  SizedBox(height: 16),
                  CheetahInput(
                    labelText: 'City',
                    onSaved: (String? value) {
                      _city = value;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CheetahButton(
                        text: 'Add',
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;
                          _formKey.currentState!.save();
                          controller.addUser(User(_name, _city));
                        },
                      ),
                      SizedBox(width: 8),
                      CheetahButton(
                        text: 'List',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserListScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  UserList(),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
