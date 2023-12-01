// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
    Course({
        required this.statusCode,
        required this.courses,
    });

    int statusCode;
    List<CourseElement> courses;

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        statusCode: json["statusCode"],
        courses: List<CourseElement>.from(json["courses"].map((x) => CourseElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
    };
}

class CourseElement {
    CourseElement({
        required this.num,
        required this.course,
        required this.url,
    });

    String num;
    String course;
    String url;

    factory CourseElement.fromJson(Map<String, dynamic> json) => CourseElement(
        num: json["num"],
        course: json["course"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "num": num,
        "course": course,
        "url": url,
    };
}
