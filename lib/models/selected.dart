// To parse this JSON data, do
//
//     final selected = selectedFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Selected> selectedFromJson(String str) => List<Selected>.from(json.decode(str).map((x) => Selected.fromJson(x)));

String selectedToJson(List<Selected> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Selected {
    Selected({
        required this.campusSelected,
        required this.facultySelected,
        required this.courseSelected,
        required this.groupSelected,
    });

    String campusSelected;
    String facultySelected;
    String courseSelected;
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
}
