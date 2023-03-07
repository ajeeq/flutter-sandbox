// To parse this JSON data, do
//
//     final selected = selectedFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:hive/hive.dart';

part 'selected.g.dart';


List<Selected> selectedFromJson(String str) => List<Selected>.from(json.decode(str).map((x) => Selected.fromJson(x)));

String selectedToJson(List<Selected> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 0)
class Selected {

    @HiveField(0)
    Selected({
        required this.campusSelected,
        required this.facultySelected,
        required this.courseSelected,
        required this.groupSelected,
    });

    @HiveField(1)
    String campusSelected;

    @HiveField(2)
    String facultySelected;

    @HiveField(3)
    String courseSelected;

    @HiveField(4)
    String groupSelected;

    factory Selected.fromJson(Map<String, dynamic> json) => Selected(
        campusSelected: json["campusSelected"],
        facultySelected: json["facultySelected"],
        courseSelected: json["courseSelected"],
        groupSelected: json["groupSelected"],
    );

    Map<String, dynamic> toJson() => {
        "campusSelected": campusSelected,
        "facultySelected": facultySelected,
        "courseSelected": courseSelected,
        "groupSelected": groupSelected,
    };

    @override
    String toString() {
      return 'Selected{campusSelected: $campusSelected, facultySelected: $facultySelected, courseSelected: $courseSelected, groupSelected: $groupSelected}';
    }
}
