/**
 * Update: 28/11/23, iCRESS now revamped to this website,
 * https://simsweb4.uitm.edu.my/estudent/class_timetable/index.htm
 */

// Import directives
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:flutter_riverpod/flutter_riverpod.dart';

// List of Models
import 'package:flutter_sandbox/models/cam_fac.dart';
import 'package:flutter_sandbox/models/course.dart';
import 'package:flutter_sandbox/models/detail.dart';
import 'package:flutter_sandbox/models/group.dart';
import 'package:flutter_sandbox/models/selected.dart';

// const baseUrl = 'https://icress.uitm.edu.my/timetable/search.asp';
const baseUrl = 'https://simsweb4.uitm.edu.my/estudent/class_timetable/index.htm';
const resultUrl ="https://simsweb4.uitm.edu.my/estudent/class_timetable/index_result.cfm";
const campusLink = 'https://simsweb4.uitm.edu.my/estudent/class_timetable/cfc/select.cfc?method=find_cam_icress_student&key=All&page=1&page_limit=30';
const facultyLink = 'https://simsweb4.uitm.edu.my/estudent/class_timetable/cfc/select.cfc?method=find_fac_icress_student&key=All&page=1&page_limit=30';
const baseListUrl = 'https://icress.uitm.edu.my/timetable/list/';
var headers = {
  "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36",
  'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
  'content-type': 'application/x-www-form-urlencoded',
  // "Referer": "https://simsweb4.uitm.edu.my/estudent/class_timetable/index.htm",
};

class SimsWeb4 {
  // Fetching campus list
  static Future<CampusFaculty> getCampuses() async {
    final response = await http.get(Uri.parse(campusLink), headers: headers);
    try {
      if (response.statusCode == 200) {
        try {
          return campusFacultyFromJson(response.body);
        }
        catch (e) {
          rethrow;
        }
      }
      else {
        throw 'Error connecting to iCRESS😐';
      }
    } catch (e) {
      rethrow;
    }
  }

  // Fetching faculty list
  static Future<CampusFaculty> getFaculties() async {
    final response = await http.get(Uri.parse(facultyLink), headers: headers);
    try {
      if (response.statusCode == 200) {
        try {
          return campusFacultyFromJson(response.body);
        }
        catch (e) {
          rethrow;
        }
      }
      else {
        throw 'Error connecting to iCRESS😐';
      }
    } catch (e) {
      rethrow;
    }
  }


  // Fetching course list
  static Future<Course> getCourses(selectedCampus, selectedFaculty) async {
    // declaring riverpod state providers
    
    // var campusCode = campusNameState.toString().split(" -")[0].trim();
    var campusCode = '';
    
    if (selectedCampus == "SELANGOR CAMPUS - ( Please Select a Faculty )")
      campusCode = "B";
    else if (selectedCampus == "SELANGOR CAMPUS - LANGUAGE COURSES")
      campusCode = "APB";
    else if (selectedCampus == "SELANGOR CAMPUS - CITU COURSES")
      campusCode = "CITU";
    else if (selectedCampus == "SELANGOR CAMPUS - CO-CURRICULUM COURSES")
      campusCode = "HEP";
    else
      campusCode = selectedCampus.split("-")[0].trim();

    // print(campusCode);
    var facultyCode = selectedFaculty.split("-")[0].trim();
    
    Course data;
    List<CourseElement> courses = [];

    var resultHeaders = {
      "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36",
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
      'content-type': 'application/x-www-form-urlencoded',
      "x-requested-with": "XMLHttpRequest",
      "Referer": "https://simsweb4.uitm.edu.my/estudent/class_timetable/index.htm",
    };

    var body = "search_campus=$campusCode&search_faculty=$facultyCode&search_course=";
    // print(body);

    final response = await http.post(Uri.parse(resultUrl), headers: resultHeaders, body: body);
    try {
      if (response.statusCode == 200) {
        var document = parser.parse(response.body);
        // var document = parser.parse(htmlData);
        // print(document);

        try {
          var tableCourse = document.querySelectorAll("#datatable-buttons > tbody")[0];
          var trs = tableCourse.querySelectorAll("tr");
          var courseBaseUrl = 'https://simsweb4.uitm.edu.my/estudent/class_timetable/';
          
          for (var i=0; i<trs.length; i++) {
            final num = trs[i].children[0].text.toString().trim();
            final course = trs[i].children[1].text.toString().trim();
            final button = trs[i].getElementsByTagName('button[type="button"]')[0].attributes['onclick'];
            final parts = button?.split("'");
            final url = parts?[1] ?? '';
            final fullUrl = courseBaseUrl + url;
            // print(fullUrl);

            var course_obj = CourseElement(num: num, course: course, url: fullUrl);
            courses.add(course_obj);
          }

          data = Course(
            statusCode: response.statusCode,
            courses: courses
          );

          final courseList = courseToJson(data);
          // print(courseList);
          return courseFromJson(courseList);
        }
        catch (e) {
          print("Exception level 2: $e");
          throw e;
        }
      } else {
        print("Error: response.statusCode: ${response.statusCode}");
        // const courseList = null;
        // return courseList;
        throw 'Error connecting to iCRESS😐';
      }
    } catch (e) {
      print("Exception level 1: $e");
      throw e;
    }
  }


  // Fetching group list
  static Future<Group> getGroup(selectedCampus, selectedFaculty, selectedCourse) async {
    var campusCode = selectedCampus.split("-")[0].trim();
    var facultyCode = selectedFaculty.split("-")[0].trim();
    var courseCode = selectedCourse;

    var groupDuplicated = [];
    String validity;
    Group data;
    List<GroupElement> groups = [];
    String groupListUri;
    
    if (campusCode == "B") {
      // ignore: prefer_interpolation_to_compose_strings
      groupListUri = baseListUrl + "B/" + facultyCode + "/" + courseCode + ".html";
    }
    else {
      // ignore: prefer_interpolation_to_compose_strings
      groupListUri = baseListUrl + campusCode + "/" + courseCode + ".html";
    }

    final response = await http.get(Uri.parse(groupListUri), headers: headers);

    try {
      if (response.statusCode == 200) {
        var document = parser.parse(response.body);

        try {
          // fetching date validity
          var tableCourseValid = document.querySelectorAll("body > table > tbody > tr");
          final thead = tableCourseValid[0].children[0].text.toString().trim().split("<br>")[0];
          final theadParts = thead.split("as");
          validity = theadParts[1].trim();

          // fetching specific course code row table element
          var tableCourse = document.querySelectorAll("body > table > tbody > tr");

          // fetching all course code data
          for (var i=2; i<tableCourse.length; i++) {
            groupDuplicated.add(tableCourse[i].children[2].text.toString().trim());
          }

          // removing duplicated course code
          var distinct = groupDuplicated.toSet().toList();

          for (var element in distinct) {
            final id = distinct.indexOf(element);
            final group = element;
            var groupObj = GroupElement(id: id, group: group);
            groups.add(groupObj);
          }

          data = Group(
            valid: validity,
            statusCode: response.statusCode,
            groups: groups
          );

          final groupList = groupToJson(data);
          return groupFromJson(groupList);
        }
        catch (e) {
          rethrow;
        }
      }
      else {
        const groupList = null;
        return groupList;
      }
    
    } catch (e) {
      rethrow;
    }
  }


  // Fetching detail list based on selected campus, course, group
  static Future<Detail> getDetails(rawJson) async {
    final input = selectedFromJson(rawJson);
    var campusCodeArray = [];
    var facultySelectedArray = [];
    var courseSelectedArray = [];
    var groupSelectedArray = [];

    int statusCode = 0;
    Detail data;
    List<DetailElement> details = [];
    String newUrl;

    for (var i=0; i<input.length; i++) {
      var counter = input[i];
      campusCodeArray.add(counter.campusSelected.split("-")[0].trim());
      facultySelectedArray.add(counter.facultySelected.split("-")[0].trim());
      courseSelectedArray.add(counter.courseSelected);
      groupSelectedArray.add(counter.groupSelected);
    }

    try {
      for (var i=0; i<input.length; i++) {
        if (campusCodeArray[i] == "B") {
          // ignore: prefer_interpolation_to_compose_strings
          newUrl = baseListUrl + "B/" + facultySelectedArray[i] + "/" + courseSelectedArray[i] + ".html";
        }
        else {
          // ignore: prefer_interpolation_to_compose_strings
          newUrl = baseListUrl + campusCodeArray[i] + "/" + courseSelectedArray[i] + ".html";
        }


        final response = await http.get(Uri.parse(newUrl), headers: headers);
        try {
          if (response.statusCode == 200) {
            statusCode = response.statusCode;
            var document = parser.parse(response.body);
            try {
              // getting specific element selector
              var tableCourse = document.querySelectorAll("body > table > tbody > tr");

              // collecting all details in the table
              for (var j=2; j<tableCourse.length; j++) {
                final campus = campusCodeArray[i];
                final faculty = facultySelectedArray[i];
                final course = courseSelectedArray[i];
                var group = tableCourse[j].children[2].text.toString().trim();
                final daytime = tableCourse[j].children[1].text.toString().trim();
                final mode = tableCourse[j].children[3].text.toString().trim();
                final status = tableCourse[j].children[4].text.toString().trim();
                final room = tableCourse[j].children[5].text.toString().trim();
                
                if (group == groupSelectedArray[i]) {
                  group = groupSelectedArray[i];

                  // day: getting day in DAY TIME column
                  // MONDAY

                  // bothTime: getting start and end time in DAY TIME column 
                  // 14:00 PM-15:00 PM )

                  // time: cleaned start and end time
                  // 14:00 PM-15:00 PM

                  // meridiemStart/meridiemEnd: getting start time including trailing meridiem
                  // 08:00 AM

                  // start/end: removing leading zero
                  // 8:00 AM

                  final day = daytime.split("(")[0];
                  final bothTime = daytime.split("(")[1];
                  final time = bothTime.substring(1, bothTime.indexOf(')')).trim();
                  
                  var meridiemStart = time.split("-")[0];
                  var start = meridiemStart.replaceAll(RegExp('/^(?:00:)?0?/'), '');

                  var meridiemEnd = time.split("-")[1];
                  var end = meridiemEnd.replaceAll(RegExp('/^(?:00:)?0?/'), '');

                  final detailObj = DetailElement(
                    campus: campus, 
                    faculty: faculty, 
                    course: course, 
                    group: group, 
                    start: start, 
                    end: end, 
                    day: day, 
                    mode: mode, 
                    status: status, 
                    room: room
                  );
                  details.add(detailObj);
                }
              }
            }
            catch (e) {
              rethrow;
            }
          }
          else {
            const detailsList = null;
            return detailsList;
          }
        }
        catch (e) {
          rethrow;
        }
      }

      data = Detail(
        statusCode: statusCode, 
        details: details
      );

      final detailsList = detailToJson(data);
      return detailFromJson(detailsList);

    } catch (e) {
      rethrow;
    }
  }

}