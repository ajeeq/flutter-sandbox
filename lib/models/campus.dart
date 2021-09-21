// To parse this JSON data, do
//
//     final campus = campusFromJson(jsonString);

import 'dart:convert';

Campus campusFromJson(String str) => Campus.fromJson(json.decode(str));

String campusToJson(Campus data) => json.encode(data.toJson());

class Campus {
    Campus({
        required this.campuses,
    });

    List<CampusElement> campuses;

    factory Campus.fromJson(Map<String, dynamic> json) => Campus(
        campuses: List<CampusElement>.from(json["campuses"].map((x) => CampusElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "campuses": List<dynamic>.from(campuses.map((x) => x.toJson())),
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
