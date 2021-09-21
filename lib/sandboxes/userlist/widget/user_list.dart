import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox_riverpod/sandboxes/userlist/controllers/UserListController.dart';
import 'package:sandbox_riverpod/sandboxes/userlist/controllers/providers.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, WidgetRef ref, child) {
        final userList = ref.watch(userListProvider);
        final UserListController controller = ref.read(userListProvider.notifier);

        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Card(
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${userList[index].name}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'City: ${userList[index].city}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => controller.deleteUser(userList[index]),
                  )
                ],
              ),
            ),
          ),
          itemCount: userList.length,
        );

      }
    );
  }
}
