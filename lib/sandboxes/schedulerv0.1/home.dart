/// RESOURCES:
///  1) https://pusher.com/tutorials/flutter-listviews
/// 

// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Services
import 'package:flutter_sandbox/services.dart';

// Models
import 'package:flutter_sandbox/models/detail.dart';
import 'package:flutter_sandbox/models/selected.dart';

// Providers
import 'package:flutter_sandbox/providers/selected_providers.dart';
import 'package:flutter_sandbox/providers/detail_providers.dart';

class Home extends ConsumerWidget{
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // declaring riverpod state providers
    final selectionListState = ref.watch(selectedListProvider);

    // declaring notifiers for updating riverpod states
    final DetailListNotifier detailListController = ref.read(detailListProvider.notifier);
    final SelectedListNotifier selectionListController = ref.read(selectedListProvider.notifier);
        
    return Scaffold(
      appBar: AppBar(
        title: Text("Scheduler V0.1"),
      ),
      body: selectionListState.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Empty :(',
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: <Widget>[
                Text(
                  'Course List',
                  style: TextStyle(
                    fontFamily: 'avenir',
                    fontSize: 32,
                    fontWeight: FontWeight.w900
                  ),
                ),
                for (var i=0; i<selectionListState.length; i++) Card(
                  child: ListTile(
                    title: Text(selectionListState[i].courseSelected),
                    trailing: Icon(Icons.delete),
                    onTap: () {
                      selectionListController.deleteSelected(selectionListState[i]);
                    },
                  ),
                ),
                  
              ],
            ),
          ),
          
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            tooltip: "Add course",
            heroTag: "add",
            backgroundColor: Colors.lightBlue,
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/selection');
            },
          ),
  
          SizedBox(height: 16),
  
          FloatingActionButton(
            tooltip: "Fetch Details",
            heroTag: "fetch",
            backgroundColor: Colors.lightBlue,
            child: const Icon(Icons.find_in_page),
            onPressed: () async {
              // reading campus, course, group in Provider state
              final jsonString = selectedToJson(selectionListState);
    
              Services.getDetails(jsonString).then((details) {
                final List<DetailElement> jsonStringData = details;
        
                print("==================================");
                print("Details: " + jsonStringData.toString());
                print("==================================");
        
                // updating details list returned from API using Riverpod
                detailListController.updateDetailList(jsonStringData);
    
                Navigator.pushNamed(context, "/result");
              });
            },
          ),

          SizedBox(height: 16),

          FloatingActionButton(
            tooltip: "Debug that shown in Snackbar",
            heroTag: "snack",
            backgroundColor: Colors.lightBlue,
            child: const Icon(Icons.miscellaneous_services),
            onPressed: () async {
              final jsonString = selectedToJson(selectionListState);

              final snackBar = SnackBar(
                content: Text("Selection input: " + jsonString),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
    );
  }
}