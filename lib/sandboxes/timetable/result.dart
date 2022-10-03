/// RESOURCES:
///  1) https://pusher.com/tutorials/flutter-listviews
/// 

// Import directives
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sandbox/models/detail.dart';
// import '../../Flutter_Weekly_TimeTable-master/lib/weekly_timetable.dart';
// import '../../timetable_view-master/lib/timetable_view.dart';
import './timetable_view.dart';

// Services
import 'package:flutter_sandbox/services.dart';

// Provider
import 'package:flutter_sandbox/providers/detail_providers.dart';

class Result extends ConsumerWidget{
  Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final detailsList = detailFromJson('{"statusCode":200,"details":[{"campus":"M3","faculty":"","course":"CSC577","group":"M3CS2304C","start":15,"end":16,"day":"MONDAY","mode":"BOTH - Fulltime and Part-time","status":"First Timer and Repeater","room":""},{"campus":"M3","faculty":"","course":"CSC577","group":"M3CS2304C","start":16,"end":18,"day":"MONDAY","mode":"BOTH - Fulltime and Part-time","status":"First Timer and Repeater","room":"MAKMAL KOMPUTER 4,MAKMAL KOMPUTER 5"},{"campus":"M3","faculty":"","course":"ICT502","group":"M3CS2303C","start":8,"end":10,"day":"MONDAY","mode":"BOTH - Fulltime and Part-time","status":"First Timer and Repeater","room":"BILIK SEMINAR 01 (PPP)"},{"campus":"M3","faculty":"","course":"ICT502","group":"M3CS2303C","start":10,"end":12,"day":"FRIDAY","mode":"BOTH - Fulltime and Part-time","status":"First Timer and Repeater","room":"BILIK TUTORIAL 01"}]}');
    final detailsList = ref.watch(detailListProvider);
    bool clashed = false;

    try {
      for (var i=0; i<detailsList.length; i++) {
        for (var j=i+1; j<detailsList.length; j++) {
          if(detailsList[i].day == detailsList[j].day) {
            if(detailsList[i].end > detailsList[j].start && detailsList[i].start < detailsList[j].end) {
            	print(detailsList[i].course + "(" + detailsList[i].start.toString() + "-" + detailsList[i].end.toString() + ")" + " clashed with " + detailsList[j].course + "(" + detailsList[j].start.toString() + "-" + detailsList[j].end.toString() + ")");
              clashed = true;
              return Scaffold(
                appBar: AppBar(
                  title: Text("Timetable"),
                ),
                body: Text(detailsList[i].course + "(" + detailsList[i].start.toString() + "-" + detailsList[i].end.toString() + ")" + " clashed with " + detailsList[j].course + "(" + detailsList[j].start.toString() + "-" + detailsList[j].end.toString() + ")")
              );
            }
          }
        }
      }

      return Scaffold(
        appBar: AppBar(
          title: Text("Timetable"),
        ),
        body: TimetableView(
          laneEventsList: _buildLaneEvents(detailsList),
          onEventTap: onEventTapCallBack,
          timetableStyle: TimetableStyle(),
          onEmptySlotTap: onTimeSlotTappedCallBack,
        ),

        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              tooltip: "Add course",
              heroTag: "add",
              backgroundColor: Colors.lightBlue,
              child: const Icon(Icons.add),
              onPressed: () {},
            ),
    
            SizedBox(height: 16),
    
            FloatingActionButton(
              tooltip: "Fetch Details",
              heroTag: "fetch",
              backgroundColor: Colors.lightBlue,
              child: const Icon(Icons.find_in_page),
              onPressed: () async {},
            ),

            SizedBox(height: 16),

            FloatingActionButton(
              tooltip: "Debug that shown in Snackbar",
              heroTag: "snack",
              backgroundColor: Colors.lightBlue,
              child: const Icon(Icons.miscellaneous_services),
              onPressed: () async {},
            ),
          ],
        ),
      );
    }
    catch (e) {
      throw e;
    }
  }

  List<LaneEvents> _buildLaneEvents(detailsList) {
    final dates = {
      "mon": <String>['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY'],
      "sun": <String>['SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY'],
    };

    int k = 10;

    return [
      for (var i=0; i<dates["mon"]!.length; i++) LaneEvents(
        lane: Lane(name: dates["mon"]![i], laneIndex: i),
        events: [
          for (var j=0; j<detailsList.length; j++)
            if(detailsList[j].day == dates["mon"]![i]) TableEvent(
              title: detailsList[j].course,
              eventId: k+1,
              startTime: TableEventTime(hour: detailsList[j].start, minute: 0),
              endTime: TableEventTime(hour: detailsList[j].end, minute: 0),
              laneIndex: i,
            )
        ],
      ),
    ];
  }

  void onEventTapCallBack(TableEvent event) {
    print(
        "Event Clicked!! LaneIndex ${event.laneIndex} Title: ${event.title} StartHour: ${event.startTime.hour} EndHour: ${event.endTime.hour}");
  }

  void onTimeSlotTappedCallBack(
      int laneIndex, TableEventTime start, TableEventTime end) {
    print(
        "Empty Slot Clicked !! LaneIndex: $laneIndex StartHour: ${start.hour} EndHour: ${end.hour}");
  }
}

// time clash