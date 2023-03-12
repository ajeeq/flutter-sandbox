// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

// Services
import 'package:flutter_sandbox/api/services.dart';
import 'package:flutter_sandbox/api/servicestwo.dart';

// Utils
import 'package:flutter_sandbox/sandboxes/timetable/utils/utils_main.dart';

// Models
import 'package:flutter_sandbox/models/detail.dart';
import 'package:flutter_sandbox/models/selected.dart';

// Providers
import 'package:flutter_sandbox/providers/selected_providers.dart';
import 'package:flutter_sandbox/providers/detail_providers.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_sandbox/sandboxes/timetable/utils/hive_selected_course.dart';

class Home extends ConsumerWidget{
  const Home({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // declaring riverpod state providers
    final selectionListState = ref.watch(selectedListProvider);

    // declaring notifiers for updating riverpod states
    final SelectedListNotifier selectionListController = ref.read(selectedListProvider.notifier);
    final DetailListNotifier detailListController = ref.read(detailListProvider.notifier);

    final detailsList = ref.watch(detailListProvider);

    final HiveSelectedCourse selectedCourseStore = HiveSelectedCourse();
    
    final Uri _url = Uri.parse('https://discord.gg/2uWksRgT');
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 217, 217, 217),
      appBar: AppBar(
        title: const Text("Timetable 0.4"),
      ),
      body: ValueListenableBuilder(
          valueListenable: HiveSelectedCourse.box.listenable(),
          builder: (context, Box box, widget) {
            return SafeArea(
              child: box.isEmpty ?
                Container(
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
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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

                      // for (var i=0; i<selectionListState.length; i++) Card(
                      //   child: ExpansionTile(
                      //     textColor: Colors.black,
                      //     title: Text(selectionListState[i].courseSelected),
                      //     subtitle: Text(selectionListState[i].groupSelected),
                      //     children: [
                      //       ListTile(title: Text("detailsList[i].day")),
                      //       ListTile(
                      //         trailing: const Icon(Icons.delete),
                      //         onTap: () {
                      //           showDialog<String>(
                      //             context: context,
                      //             builder: (BuildContext context) => AlertDialog(
                      //               title: const Text('Delete Course'),
                      //               content: const Text('Are you sure to delete this course?'),
                      //               actions: <Widget>[
                      //                 TextButton(
                      //                   onPressed: () {
                      //                     Navigator.pop(context);
                      //                   },
                      //                   child: const Text('Cancel'),
                      //                 ),
                      //                 TextButton(
                      //                   onPressed: () {
                      //                     selectionListController.deleteSelected(selectionListState[i]);
                      //                     Navigator.pop(context);
                      //                   }, 
                      //                   child: const Text('OK'),
                      //                 ),
                      //               ],
                      //             )
                      //           );
                      //         },
                              
                      //       )
                      //     ],
                      //   ),
                      // ),
        
                      // ExpansionPanelList(
                      //   expansionCallback: (int index, bool isExpanded) {},
                      //   children: [
                      //     ExpansionPanel(
                      //       headerBuilder: (BuildContext context, bool isExpanded) {
                      //         return ListTile(
                      //           title: Text('Item 1'),
                      //         );
                      //       },
                      //       body: ListTile(
                      //         title: Text('Item 1 child'),
                      //         subtitle: Text('Details goes here'),
                      //       ),
                      //       isExpanded: true,
                      //     ),
                      //     ExpansionPanel(
                      //       headerBuilder: (BuildContext context, bool isExpanded) {
                      //         return ListTile(
                      //           title: Text('Item 2'),
                      //         );
                      //       },
                      //       body: ListTile(
                      //         title: Text('Item 2 child'),
                      //         subtitle: Text('Details goes here'),
                      //       ),
                      //       isExpanded: false,
                      //     ),
                      //   ],
                      // );
                        
                
              )
            );
            
          }
         
          
        ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('UiTM Scheduler 0.4.0'),
            ),
            ListTile(
              leading: Icon(
                Icons.info,
              ),
              title: const Text('About'),
              onTap: () async {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/help');
                Navigator.pushNamed(context, "/about");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.discord,
              ),
              title: const Text('Get Help on Discord!'),
              onTap: () async {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/help');
                _launchUrl();
              },
            ),
          ]
        )
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
              // final jsonString = selectedToJson(selectionListState);

              List<Selected> selectedList = selectedCourseStore.getAllSelected();
              final String jsonString = selectedToJson(selectedList);

              if(jsonString == [])
                print("empty");
    
              ServicesTwo.getDetails(jsonString).then((details) {
                final List<DetailElement> jsonStringData = details.details;
                bool clashed = false;
                // print("jsonStringData: $jsonStringData");
        
                // updating details list returned from API using Riverpod
                detailListController.updateDetailList(jsonStringData); //jsonStringData = detailsList.details
                
                // TODO: Refactor and separate this code into Utils
                for (var i=0; i<jsonStringData.length; i++) {
                  for (var j=i+1; j<jsonStringData.length; j++) {
                    // if first time is the same day with the second day
                    if(jsonStringData[i].day == jsonStringData[j].day) {
                      String startHourFormer = (jsonStringData[i].start).split(":")[0];
                      String startMinuteFormer = (jsonStringData[i].start).split(":")[1].split(" ")[0];

                      String endHourFormer = (jsonStringData[i].end).split(":")[0];
                      String endMinuteFormer = (jsonStringData[i].end).split(":")[1].split(" ")[0];

                      String startHourLatter = (jsonStringData[j].start).split(":")[0];
                      String startMinuteLatter = (jsonStringData[j].start).split(":")[1].split(" ")[0];

                      String endHourLatter = (jsonStringData[j].end).split(":")[0];
                      String endMinuteLatter = (jsonStringData[j].end).split(":")[1].split(" ")[0];

                      var summedMinutesStartFormer = UtilsMain.hourToMinute(startHourFormer, startMinuteFormer);
                      var summedMinutesEndFormer = UtilsMain.hourToMinute(endHourFormer, endMinuteFormer);
                      var summedMinutesStartLatter = UtilsMain.hourToMinute(startHourLatter, startMinuteLatter);
                      var summedMinutesEndLatter = UtilsMain.hourToMinute(endHourLatter, endMinuteLatter);

                      if(summedMinutesEndFormer > summedMinutesStartLatter && summedMinutesStartFormer < summedMinutesEndLatter) {
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