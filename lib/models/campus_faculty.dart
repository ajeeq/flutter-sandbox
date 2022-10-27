// To parse this JSON data, do
//
//     final campus = campusFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Campus campusFromJson(String str) => Campus.fromJson(json.decode(str));

String campusToJson(Campus data) => json.encode(data.toJson());

class Campus {
    Campus({
        required this.statusCode,
        required this.campuses,
        required this.faculties,
    });

    int statusCode;
    List<CampusElement> campuses;
    List<FacultyElement> faculties;

    factory Campus.fromJson(Map<String, dynamic> json) => Campus(
        statusCode: json["statusCode"],
        campuses: List<CampusElement>.from(json["campuses"].map((x) => CampusElement.fromJson(x))),
        faculties: List<FacultyElement>.from(json["faculties"].map((x) => FacultyElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "campuses": List<dynamic>.from(campuses.map((x) => x.toJson())),
        "faculties": List<dynamic>.from(faculties.map((x) => x.toJson())),
    };
}

class CampusElement {
    CampusElement({
        required this.id,
        required this.campus,
    });

    int id;
    String campus;

    factory CampusElement.fromJson(Map<String, dynamic> json) => CampusElement(
        id: json["id"],
        campus: json["campus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "campus": campus,
    };
}

class FacultyElement {
    FacultyElement({
        required this.id,
        required this.faculty,
    });

    int id;
    String faculty;

    factory FacultyElement.fromJson(Map<String, dynamic> json) => FacultyElement(
        id: json["id"],
        faculty: json["faculty"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "faculty": faculty,
    };
}
