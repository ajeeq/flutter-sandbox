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
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // declaring riverpod state providers
    final selectionListState = ref.watch(selectedListProvider);

    // declaring notifiers for updating riverpod states
    final SelectedListNotifier selectionListController = ref.read(selectedListProvider.notifier);
    final DetailListNotifier detailListController = ref.read(detailListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Timetable 0.2"),
      ),
      body: selectionListState.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Center(
                child: Text(
                  "No data. Please add course(s) by tapping '+' button on the bottom right corner.",
                ),
              )
            ],
          )
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: <Widget>[
                const Text(
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
                    trailing: const Icon(Icons.delete),
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
  
          const SizedBox(height: 16),
  
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
                bool clashed = false;
        
                // updating details list returned from API using Riverpod
                detailListController.updateDetailList(jsonStringData); //jsonStringData = detailsList.details

                for (var i=0; i<jsonStringData.length; i++) {
                  for (var j=i+1; j<jsonStringData.length; j++) {
                    if(jsonStringData[i].day == jsonStringData[j].day) {
                      if(jsonStringData[i].end > jsonStringData[j].start && jsonStringData[i].start < jsonStringData[j].end) {
                        print(jsonStringData[i].course + "(" + jsonStringData[i].start.toString() + "-" + jsonStringData[i].end.toString() + ")" + " is clashed with " + jsonStringData[j].course + "(" + jsonStringData[j].start.toString() + "-" + jsonStringData[j].end.toString() + ")");
                        clashed = true;
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Time clash occured!'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text("${jsonStringData[i].course}-${jsonStringData[i].group} (${jsonStringData[i].start}-${jsonStringData[i].end})"),
                                    Text("is clashed with"),
                                    Text("${jsonStringData[j].course}-${jsonStringData[j].group} (${jsonStringData[j].start}-${jsonStringData[j].end})"),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Okay'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  }
                }
    
                Navigator.pushNamed(context, "/result");
              });
            },
          ),
          
        ],
      ),
    );
  }
}