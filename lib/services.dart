// Import directives
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

// List of Models
import 'package:flutter_sandbox/models/user.dart';
import 'package:flutter_sandbox/models/campus.dart';
import 'package:flutter_sandbox/models/course.dart';
import 'package:flutter_sandbox/models/detail.dart';
import 'package:flutter_sandbox/models/group.dart';

class Services {
  static Future<List<User>> getUsers() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    
    try {
      final response = await http.get(url);

      if(response.statusCode == 200) {
        final users = userFromJson(response.body);
        return users;
      }
      else {
        final users = null;
        return users;
      }
    }
    catch (e) {
      throw e;
    }
  }

  // Fetching campus list
  static Future<List<CampusElement>> getCampuses() async {
    var url = Uri.parse("${dotenv.env['API_BASE_URI_CAMPUS']}");
    
    try {
      final response = await http.get(url);

      if(response.statusCode == 200) {
        final campusList = campusFromJson(response.body);
        return campusList.campuses;
      }
      else {
        final campusList = null;
        return campusList;
      }
    }
    catch (e) {
      throw e;
    }
  }

  // Fetching campus list
  static Future<List<Faculty>> getFaculties() async {
    var url = Uri.parse("${dotenv.env['API_BASE_URI_CAMPUS']}");
    
    try {
      final response = await http.get(url);

      if(response.statusCode == 200) {
        final facultyList = campusFromJson(response.body);
        return facultyList.faculties;
      }
      else {
        final facultyList = null;
        return facultyList;
      }
    }
    catch (e) {
      throw e;
    }
  }

  // Fetching course list
  static Future<List<CourseElement>> getCourses(selectedCampus, selectedFaculty) async {
    var url = Uri.parse("${dotenv.env['API_BASE_URI_COURSE']}");
    var body = {
      "campusInputUser": selectedCampus,
      "facultyInputUser": selectedFaculty,
    };
    
    try {
      final response = await http.post(url, body: body);

      if(response.statusCode == 200) {
        final courseList = courseFromJson(response.body);
        return courseList.courses;
      }
      else {
        final courseList = null;
        return courseList;
      }
    }
    catch (e) {
      throw e;
    }
  }

  // Fetching group list
  static Future<List<GroupElement>> getGroup(selectedCampus, selectedFaculty, selectedCourse) async {
    var url = Uri.parse("${dotenv.env['API_BASE_URI_GROUP']}");
    var body = {
      "campusInputUser": selectedCampus,
      "facultyInputUser": selectedFaculty,
      "courseInputUser": selectedCourse,
    };
    
    try {
      final response = await http.post(url, body: body);

      if(response.statusCode == 200) {
        final groupList = groupFromJson(response.body);
        return groupList.groups;
      }
      else {
        final groupList = null;
        return groupList;
      }
    }
    catch (e) {
      throw e;
    }
  }

  // Fetching detail list based on selected campus, course, group
  static Future<List<DetailElement>> getDetails(rawJson) async {
    var url = Uri.parse("${dotenv.env['API_BASE_URI_DETAIL']}");
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var body = rawJson;
    // print("services.dart: " + rawJson);

    try {
      final response = await http.post(url, headers: headers, body: body);

      if(response.statusCode == 200) {
        final detailsList = detailFromJson(response.body);
        return detailsList.details;
      }
      else {
        List<DetailElement> detailsList = [];
        return detailsList;
      }
    }
    catch (e) {
      throw e;
    }
  }

}