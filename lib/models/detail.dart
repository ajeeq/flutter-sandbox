// To parse this JSON data, do
//
//     final detail = detailFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

Detail detailFromJson(String str) => Detail.fromJson(json.decode(str));

String detailToJson(Detail data) => json.encode(data.toJson());

class Detail {
    Detail({
        required this.statusCode,
        required this.details,
    });

    int statusCode;
    List<DetailElement> details;

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        statusCode: json["statusCode"],
        details: List<DetailElement>.from(json["details"].map((x) => DetailElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
    };
}

class DetailElement {
    DetailElement({
        required this.campus,
        required this.faculty,
        required this.course,
        required this.group,
        required this.start,
        required this.end,
        required this.day,
        required this.mode,
        required this.status,
        required this.room,
    });

    String campus;
    String faculty;
    String course;
    String group;
    int start;
    int end;
    String day;
    String mode;
    String status;
    String room;

    factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
        campus: json["campus"],
        faculty: json["faculty"],
        course: json["course"],
        group: json["group"],
        start: json["start"],
        end: json["end"],
        day: json["day"],
        mode: json["mode"],
        status: json["status"],
        room: json["room"],
    );

    Map<String, dynamic> toJson() => {
        "campus": campus,
        "faculty": faculty,
        "course": course,
        "group": group,
        "start": start,
        "end": end,
        "day": day,
        "mode": mode,
        "status": status,
        "room": room,
    };
}
