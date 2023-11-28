/// RESOURCES:
///  1) https://pusher.com/tutorials/flutter-listviews
/// 

// Import directives
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import packages
import '../../../../packages/timetable_view/timetable_view.dart';

// Services
import 'package:flutter_sandbox/api/services.dart';

// Utils
import 'package:flutter_sandbox/utils/utils_main.dart';

// Provider
import 'package:flutter_sandbox/providers/detail_providers.dart';

var pixelRatio = window.devicePixelRatio;

 //Size in physical pixels
var physicalScreenSize = window.physicalSize;
var physicalWidth = physicalScreenSize.width;
var physicalHeight = physicalScreenSize.height;

//Size in logical pixels
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalWidth = logicalScreenSize.width;
var logicalHeight = logicalScreenSize.height;

//Padding in physical pixels
var padding = window.padding;

//Safe area paddings in logical pixels
var paddingLeft = window.padding.left / window.devicePixelRatio;
var paddingRight = window.padding.right / window.devicePixelRatio;
var paddingTop = window.padding.top / window.devicePixelRatio;
var paddingBottom = window.padding.bottom / window.devicePixelRatio;

//Safe area in logical pixels
var safeWidth = logicalWidth - paddingLeft - paddingRight;
var safeHeight = logicalHeight - paddingTop - paddingBottom;




// Screen size in density independent pixels
var screenWidth = (window.physicalSize.shortestSide / window.devicePixelRatio);
var screenHeight = (window.physicalSize.longestSide / window.devicePixelRatio);

// Screen size in real pixels
var screenWidthPixels = window.physicalSize.shortestSide;
var screenHeightPixels = window.physicalSize.longestSide;

class ScheduleResult extends ConsumerWidget{
  ScheduleResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final detailsList = detailFromJson('{"statusCode":200,"details":[{"campus":"M3","faculty":"","course":"CSC577","group":"M3CS2304C","start":15,"end":16,"day":"MONDAY","mode":"BOTH - Fulltime and Part-time","status":"First Timer and Repeater","room":""},{"campus":"M3","faculty":"","course":"CSC577","group":"M3CS2304C","start":16,"end":18,"day":"MONDAY","mode":"BOTH - Fulltime and Part-time","status":"First Timer and Repeater","room":"MAKMAL KOMPUTER 4,MAKMAL KOMPUTER 5"},{"campus":"M3","faculty":"","course":"ICT502","group":"M3CS2303C","start":8,"end":10,"day":"MONDAY","mode":"BOTH - Fulltime and Part-time","status":"First Timer and Repeater","room":"BILIK SEMINAR 01 (PPP)"},{"campus":"M3","faculty":"","course":"ICT502","group":"M3CS2303C","start":10,"end":12,"day":"FRIDAY","mode":"BOTH - Fulltime and Part-time","status":"First Timer and Repeater","room":"BILIK TUTORIAL 01"}]}');
    final detailsList = ref.watch(detailListProvider);
    print("detailsList: $detailsList");


    // bool clashed = false;

    try {
      // for (var i=0; i<detailsList.length; i++) {
      //   for (var j=i+1; j<detailsList.length; j++) {
      //     if(detailsList[i].day == detailsList[j].day) {
      //       if(detailsList[i].end > detailsList[j].start && detailsList[i].start < detailsList[j].end) {
      //       	print(detailsList[i].course + "(" + detailsList[i].start.toString() + "-" + detailsList[i].end.toString() + ")" + " clashed with " + detailsList[j].course + "(" + detailsList[j].start.toString() + "-" + detailsList[j].end.toString() + ")");
      //         clashed = true;
      //         return Scaffold(
      //           appBar: AppBar(
      //             title: Text("Timetable"),
      //           ),
      //           body: Text("${detailsList[i].course}(${detailsList[i].start}-${detailsList[i].end}) clashed with ${detailsList[j].course}(${detailsList[j].start}-${detailsList[j].end})")
      //         );
      //       }
      //     }
      //   }
      // }

      return Scaffold(
        appBar: AppBar(
          title: Text("Timetable"),
        ),
        body: TimetableView(
          laneEventsList: _buildLaneEvents(detailsList),
          onEventTap: onEventTapCallBack,
          timetableStyle: TimetableStyle(
            laneWidth: (safeWidth - 70) / 5
          ),
          onEmptySlotTap: onTimeSlotTappedCallBack,
        )
      );
    }
    catch (e) {
      throw e;
    }
  }

  List<LaneEvents> _buildLaneEvents(detailsList) {
    var setStartDay = UtilsMain.setStartDay(detailsList);
    final dayColumn = setStartDay.elementAt(0);
    final dayToCompare = setStartDay.elementAt(1);

    // final dayToCompare = {
    //   "mon": <String>['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY'],
    //   "sun": <String>['SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY'],
    // };

    int k = 10;

    return [
      for (var i=0; i<dayToCompare.length; i++) LaneEvents(
        lane: Lane(
          name: dayColumn[i],
          laneIndex: i,
        ),
        events: [
          for (var j=0; j<detailsList.length; j++)
            if(detailsList[j].day == dayToCompare[i]) TableEvent(
              title: detailsList[j].course,
              eventId: k+1,
              startTime: TableEventTime(hour: UtilsMain.getHourInt(detailsList[j].start), minute: UtilsMain.getMinuteInt(detailsList[j].start)),
              endTime: TableEventTime(hour: UtilsMain.getHourInt(detailsList[j].end), minute: UtilsMain.getHourInt(detailsList[j].end)),
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