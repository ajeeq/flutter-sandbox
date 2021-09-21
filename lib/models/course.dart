// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
    Course({
        required this.courses,
    });

    List<CourseElement> courses;

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        courses: List<CourseElement>.from(json["courses"].map((x) => CourseElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
    };
}

class CourseElement {
    CourseElement({
        required this.id,
        required this.course,
    });

    int id;
    String course;

    factory CourseElement.fromJson(Map<String, dynamic> json) => CourseElement(
        id: json["id"],
        course: json["course"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course": course,
    };
}
