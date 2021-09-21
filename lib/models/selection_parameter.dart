// To parse this JSON data, do
//
//     final selectionParameter = selectionParameterFromJson(jsonString);

import 'dart:convert';

List<SelectionParameter> selectionParameterFromJson(String str) => List<SelectionParameter>.from(json.decode(str).map((x) => SelectionParameter.fromJson(x)));

String selectionParameterToJson(List<SelectionParameter> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SelectionParameter {
    SelectionParameter({
        required this.campusSelected,
        required this.courseSelected,
        required this.groupSelected,
    });

    String campusSelected;
    String courseSelected;
    String groupSelected;

    factory SelectionParameter.fromJson(Map<String, dynamic> json) => SelectionParameter(
        campusSelected: json["campusSelected"],
        courseSelected: json["courseSelected"],
        groupSelected: json["groupSelected"],
    );

    Map<String, dynamic> toJson() => {
        "campusSelected": campusSelected,
        "courseSelected": courseSelected,
        "groupSelected": groupSelected,
    };
}
