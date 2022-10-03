import 'package:flutter/material.dart';
import 'package:flutter_sandbox/sandboxes/timetable/models/table_event_time.dart';

class TableEvent {
  final String title;

  /// Id to uniquely identify event. Used mainly in callbacks
  final int eventId;

  /// Id to uniquely identify the lane an event falls under. Used mainly in callbacks
  final int laneIndex;

  /// Optional. Preferably abbreviate string to less than 5 characters
  final String location;

  final TableEventTime startTime;

  final TableEventTime endTime;

  final EdgeInsets padding;

  final EdgeInsets margin;

  // //Todo:: Determine if Event ID needs to be passed to callback
  // final void Function(
  //         int laneIndex, String title, TableEventTime start, TableEventTime end)
  //     onTap;

  final BoxDecoration? decoration;

  final Color backgroundColor;

  final TextStyle textStyle;

  TableEvent({
    required this.title,
    required this.eventId,
    required this.laneIndex,
    this.location: '',
    required this.startTime,
    required this.endTime,
    this.padding: const EdgeInsets.all(10),
    this.margin: const EdgeInsets.all(1),
    // this.onTap,
    this.decoration,
    this.backgroundColor: const Color(0xCC2196F3),
    this.textStyle: const TextStyle(color: Colors.white),
  })  : assert(endTime.isAfter(startTime));
}
