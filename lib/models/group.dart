// To parse this JSON data, do
//
//     final group = groupFromJson(jsonString);

import 'dart:convert';

Group groupFromJson(String str) => Group.fromJson(json.decode(str));

String groupToJson(Group data) => json.encode(data.toJson());

class Group {
    Group({
        required this.groupArray,
    });

    List<GroupArray> groupArray;

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        groupArray: List<GroupArray>.from(json["groupArray"].map((x) => GroupArray.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "groupArray": List<dynamic>.from(groupArray.map((x) => x.toJson())),
    };
}

class GroupArray {
    GroupArray({
        required this.group,
        required this.id,
    });

    String group;
    int id;

    factory GroupArray.fromJson(Map<String, dynamic> json) => GroupArray(
        group: json["group"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "group": group,
        "id": id,
    };
}
