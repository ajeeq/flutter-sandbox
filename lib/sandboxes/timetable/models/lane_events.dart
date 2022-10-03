import 'package:flutter_sandbox/sandboxes/timetable/models/lane.dart';
import 'package:flutter_sandbox/sandboxes/timetable/models/table_event.dart';

class LaneEvents {
  final Lane lane;

  final List<TableEvent> events;

  LaneEvents({
    required this.lane,
    required this.events,
  });
}
