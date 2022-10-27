import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sandbox/sandboxes/campus/campus_list_provider.dart';

// Models
import 'package:flutter_sandbox/models/campus_faculty.dart';

class HomeCampus extends ConsumerWidget {
  HomeCampus({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('campus'),
      ),
      body: Container(
        child: Consumer(
          builder: (context, WidgetRef ref, child) {
            AsyncValue<List<CampusElement>> campuses = ref.watch(campusListProvider);

            // return campuses.when(
            //   loading: () => Center(child: const CircularProgressIndicator()),
            //   error: (e, st) => const Text("Error"),
            //   data: (data) {
            //     print("data"+ data.toString());
            //     return ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: data.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return ListTile(
            //           title: Text(((data[index].id + 1).toString()) + " - " + (data[index].campus)),
            //         );
            //       }
            //     );
            //   },
            // );
            return Expanded(child: Text("text"));
          }
        )
      )
    );
  }
}