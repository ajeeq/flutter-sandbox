// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

// Services
import 'package:flutter_sandbox/api/services.dart';
import 'package:flutter_sandbox/api/servicestwo.dart';

// Utils
import 'package:flutter_sandbox/utils/utils_main.dart';
import 'package:flutter_sandbox/utils/hive_selected_course.dart';

// Models
import 'package:flutter_sandbox/models/detail.dart';
import 'package:flutter_sandbox/models/selected.dart';

// Providers
import 'package:flutter_sandbox/providers/selected_providers.dart';
import 'package:flutter_sandbox/providers/detail_providers.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:flutter_sandbox/sandboxes/companion/widgets/top_bar.dart';

class ScheduleList extends ConsumerWidget{
  const ScheduleList({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // declaring riverpod state providers
    // final selectionListState = ref.watch(selectedListProvider);

    // declaring notifiers for updating riverpod states
    final SelectedListNotifier selectionListController = ref.read(selectedListProvider.notifier);
    final DetailListNotifier detailListController = ref.read(detailListProvider.notifier);

    final detailsList = ref.watch(detailListProvider);

    final HiveSelectedCourse selectedCourseStore = HiveSelectedCourse();
    Box<Selected> box = Hive.box<Selected>("selectedCourse");
    
    final Uri _url = Uri.parse('https://discord.gg/2uWksRgT');
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 217, 217, 217),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Column(
            children: [
              const TopBar(
                title: "Companion",
              ),
              SizedBox(height: 10),
              ValueListenableBuilder(
                  valueListenable: HiveSelectedCourse.box.listenable(),
                  builder: (context, Box box, widget) {
                    return box.isEmpty 
                    ? Container(
                      color: Colors.grey[85],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Center(
                            child: Text(
                              "No data. Please add course(s) by tapping '+' button on the bottom right corner.",
                            ),
                          )
                        ],
                      ),
                    )
                    : Container(
                        // margin: const EdgeInsets.symmetric(vertical: 20.0),
                        // padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            const Text(
                              'Course List',
                              style: TextStyle(
                                fontFamily: 'avenir',
                                fontSize: 32,
                                fontWeight: FontWeight.w900
                              ),
                            ),
              
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: box.length,
                              itemBuilder: (BuildContext context, int index) { 
                                var courseList = box.getAt(index);
              
                                return Card(
                                  child: ListTile (
                                    title: Text(courseList.courseSelected),
                                    subtitle: Text(courseList.groupSelected),
                                    trailing: const Icon(Icons.delete),
                                    onTap: () {
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          title: const Text('Delete Course'),
                                          content: const Text('Are you sure to delete this course?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                selectedCourseStore.deleteSelected(index: index);
                                                Navigator.pop(context);
                                              }, 
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        )
                                      );
                                    },
              
                                  )
                                );
                              },
                            ),
                          ],
                        ),
              
                    );
                    
                  }
                 
                  
                ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),

        ]
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
              Navigator.pushNamed(context, '/campus_selection');
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
              // final jsonString = selectedToJson(selectionListState);

              List<Selected> selectedList = selectedCourseStore.getAllSelected();
              final String jsonString = selectedToJson(selectedList);

              if(jsonString == [])
                print("empty");
    
              ServicesTwo.getDetails(jsonString).then((details) {
                final List<DetailElement> jsonStringData = details.details;
                bool clashed = false;
                // print("[home.dart] jsonStringData: $jsonStringData");
        
                // updating details list returned from API using Riverpod
                detailListController.updateDetailList(jsonStringData); //jsonStringData = detailsList.details
                
                var isClashSet = UtilsMain.isClash(jsonStringData);
                clashed = isClashSet.elementAt(0);
                
                if(clashed == true) {
                  DetailElement clashOne = isClashSet.elementAt(1);
                  DetailElement clashTwo = isClashSet.elementAt(2);

                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Time clash occured!'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text("${clashOne.course}-${clashOne.group} (${clashOne.start}-${clashOne.end})"),
                              Text("is clashed with"),
                              Text("${clashTwo.course}-${clashTwo.group} (${clashTwo.start}-${clashTwo.end})"),
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
    
                Navigator.pushNamed(context, "/result");
              });
            },
          ),

          const SizedBox(height: 16),

          FloatingActionButton(
            tooltip: "Debug that shown in Snackbar",
            heroTag: "snack",
            backgroundColor: Colors.lightBlue,
            child: const Icon(Icons.miscellaneous_services),
            onPressed: () async {
              List<Selected> selectedList = selectedCourseStore.getAllSelected();
              final String jsonString = selectedToJson(selectedList);
              print(jsonString);

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