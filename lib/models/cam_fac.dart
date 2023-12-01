// To parse this JSON data, do
//
//     final campusFaculty = campusFacultyFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CampusFaculty campusFacultyFromJson(String str) => CampusFaculty.fromJson(json.decode(str));

String campusFacultyToJson(CampusFaculty data) => json.encode(data.toJson());

class CampusFaculty {
    int total;
    List<Result> results;

    CampusFaculty({
        required this.total,
        required this.results,
    });

    factory CampusFaculty.fromJson(Map<String, dynamic> json) => CampusFaculty(
        total: json["total"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String text;
    String id;

    Result({
        required this.text,
        required this.id,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        text: json["text"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "id": id,
    };
}
