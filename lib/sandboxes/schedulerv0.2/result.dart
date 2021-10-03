// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider
import 'package:sandbox_riverpod/providers/detail_providers.dart';

class Result extends ConsumerWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // declaring riverpod state providers
    final detailListState = ref.watch(detailListProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            for (var i=0; i<detailListState.length; i++) Container(
              // width: 160.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Card(
                      elevation: 4,
                      shadowColor: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              detailListState[i].course.toString(),
                              style: const TextStyle(
                                fontFamily: 'avenir',
                                fontSize: 32,
                                fontWeight: FontWeight.w900
                              ),
                            ),
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text("Campus Code: " + detailListState[i].campus),
                              ),
                              ListTile(
                                title: Text("Course: " + detailListState[i].course),
                              ),
                              ListTile(
                                title: Text("Group: " + detailListState[i].group),
                              ),
                              ListTile(
                                title: Text("Start: " + detailListState[i].start),
                              ),
                              ListTile(
                                title: Text("End: " + detailListState[i].end),
                              ),
                              ListTile(
                                title: Text("Day: " + detailListState[i].day),
                              ),
                              ListTile(
                                title: Text("Mode: " + detailListState[i].mode),
                              ),
                              ListTile(
                                title: Text("Status: " + detailListState[i].status),
                              ),
                              ListTile(
                                title: Text("Room: " + detailListState[i].room),
                              ),
                            ],
                          ),

                        ]
                      ),
                    ),
                  ),
                ],

              ),
              
            ),
          ],
        )
      )
    );
  }
}
