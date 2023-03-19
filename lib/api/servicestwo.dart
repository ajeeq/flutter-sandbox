// Import directives
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

// List of Models
import 'package:flutter_sandbox/models/campus_faculty.dart';
import 'package:flutter_sandbox/models/course.dart';
import 'package:flutter_sandbox/models/detail.dart';
import 'package:flutter_sandbox/models/group.dart';
import 'package:flutter_sandbox/models/selected.dart';

const baseUrl = 'https://icress.uitm.edu.my/timetable/search.asp';
const baseListUrl = 'https://icress.uitm.edu.my/timetable/list/';
var headers = {
  "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
  'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
  'content-type': 'application/x-www-form-urlencoded',
};

class ServicesTwo {
  static Future<Campus> getCampusesFaculties() async {
    Campus data;
    List<CampusElement> campuses = [];
    List<FacultyElement> faculties = [];

    final response = await http.get(Uri.parse(baseUrl), headers: headers);
    try {
      if (response.statusCode == 200) {
        var document = parser.parse(response.body);

        try {
          var optionCampus = document.querySelectorAll("select#search_cam > option");
          // print("optionCampus: $optionCampus");
          for (var i=0; i<optionCampus.length; i++) {
            final id = i;
            final campus = optionCampus[i].text.trim();
            var campusObj = CampusElement(id: id, campus: campus);
            campuses.add(campusObj);
          }

          var optionFaculty = document.querySelectorAll("select#eyJ0eXAiOiiiJKV1QiLCJhbGciOiJIUzI1NiJ9 > option");
          for (var i=0; i<optionFaculty.length; i++) {
            final id = i;
            final faculty = optionFaculty[i].text.trim();
            var facultyObj = FacultyElement(id: id, faculty: faculty);
            faculties.add(facultyObj);
          }

          data = Campus(
            statusCode: response.statusCode,
            campuses: campuses,
            faculties: faculties
          );

          final campusList = campusToJson(data);
          return campusFromJson(campusList);
        }
        catch (e) {
          print("Exception 2: $e");
          throw e;
        }
      }
      else {
        print("Error: response.statusCode: ${response.statusCode}");
        // const campusList = null;
        // return campusList;
        throw 'No data available from the iCRESS at the moment😐';
        
      }
    } catch (e) {
      print("Exception 1: $e");
      throw e;
    }
  }

  // TODO: flow of getting request need to revise
  static Future<Course> getCourses(selectedCampus, selectedFaculty) async {
    var campusCode = selectedCampus.split("-")[0].trim();
    var facultyCode = selectedFaculty.split("-")[0].trim();
    
    Course data;
    List<CourseElement> courses = [];
    
    // body = optionCampus/optionFaculty in getCampusesFaculties
    var body = {
      'search_cam': campusCode,
      'eyJ0eXAiOiiJKV1QiLCJhbGciOiJIUzI1NiJ9': facultyCode 
    };

    final response = await http.post(Uri.parse(baseUrl), headers: headers, body: body);
    // print("response: + ${response.statusCode}");

    try {
      if (response.statusCode == 302) {
        if (response.headers.containsKey("location")) {
          final redirectUrl = response.headers["location"];

          final redirectedResponse = await http.post(Uri.parse(redirectUrl!), headers: headers, body: body);
          if (redirectedResponse.statusCode == 200) {
            var document = parser.parse(redirectedResponse.body);

            try {
              var tableCourse = document.querySelectorAll("#example2 > tbody")[0];
              var trs = tableCourse.querySelectorAll("tr");
              
              for (var i=0; i<trs.length; i++) {
                final num = trs[i].children[0].text.toString().trim();
                final course = trs[i].children[1].text.toString().trim();
                var courseObj = CourseElement(num: num, course: course);
                courses.add(courseObj);
              }

              data = Course(
                statusCode: redirectedResponse.statusCode,
                courses: courses
              );

              final courseList = courseToJson(data);
              return courseFromJson(courseList);
            }
            catch (e) {
              print("Exception 2: $e");
              throw e;
            }

          }
          else {
            print("Error: redirectedResponse.statusCode " + (redirectedResponse.statusCode).toString());
            const courseList = null;
            return courseList; 
          }
            
        }
        else {
          print("Error: Redirect URL or location in header not found");
          const courseList = null;
          return courseList; 
        }
      
      }
      else if (response.statusCode == 200) {
        var document = parser.parse(response.body);
        try {
          var tableCourse = document.querySelectorAll("#example2 > tbody")[0];
          var trs = tableCourse.querySelectorAll("tr");
          
          for (var i=0; i<trs.length; i++) {
            final num = trs[i].children[0].text.toString().trim();
            final course = trs[i].children[1].text.toString().trim();
            var courseObj = CourseElement(num: num, course: course);
            courses.add(courseObj);
          }

          data = Course(
            statusCode: response.statusCode,
            courses: courses
          );

          final courseList = courseToJson(data);
          return courseFromJson(courseList);
        }
        catch (e) {
          print("Exception 2: $e");
          throw e;
        }
      }
      else {
        print("No redirect.");
        print("Status Code - " + (response.statusCode).toString());
        const courseList = null;
        return courseList;
      }
    
    } catch (e) {
      print("Exception 1: $e");
      throw e;
    }
  }

  // TODO: flow of getting request need to revise
  static Future<Group> getGroup(selectedCampus, selectedFaculty, selectedCourse) async {
    var campusCode = selectedCampus.split("-")[0].trim();
    var facultyCode = selectedFaculty.split("-")[0].trim();
    var courseCode = selectedCourse;

    var groupDuplicated = [];
    String validity;
    Group data;
    List<GroupElement> groups = [];

    // baseListUrl = "https://icress.uitm.edu.my/timetable/list/";
    String groupListUri;
    
    if (campusCode == "B") {
      groupListUri = baseListUrl + "B/" + facultyCode + "/" + courseCode + ".html";
      // print("\nGroup link url: " + groupListUri);
    }
    else {
      groupListUri = baseListUrl + campusCode + "/" + courseCode + ".html";
      // print("\nGroup link url: " + groupListUri);
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
          };

          data = Group(
            valid: validity,
            statusCode: response.statusCode,
            groups: groups
          );

          final groupList = groupToJson(data);
          return groupFromJson(groupList);
        }
        catch (e) {
          print("Exception 2: $e");
          throw e;
        }
      }
      else {
        print("No redirect.");
        print("Status Code - " + (response.statusCode).toString());
        const groupList = null;
        return groupList;
      }
    
    } catch (e) {
      print("Exception 1: $e");
      throw e;
    }
  }


  static Future<Detail> getDetails(rawJson) async {
    final input = selectedFromJson(rawJson);
    // print("rawJson: $rawJson");
    var campusCodeArray = [];
    var facultySelectedArray = [];
    var courseSelectedArray = [];
    var groupSelectedArray = [];

    int statusCode = 0;
    Detail data;
    List<DetailElement> details = [];

    // baseUrl = "https://icress.uitm.edu.my/timetable/list/";
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
          newUrl = baseListUrl + "B/" + facultySelectedArray[i] + "/" + courseSelectedArray[i] + ".html";
        }
        else {
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

              // data = Detail(
              //   statusCode: response.statusCode, 
              //   details: details
              // );

              // final detailsList = detailToJson(data);
              // return detailFromJson(detailsList);
            }
            catch (e) {
              print("Exception level 2: $e");
              throw e;
            }
          }
          else {
            print("URL - " + newUrl.toString());
            print("Status Code - " + (response.statusCode).toString());
            const detailsList = null;
            return detailsList;
          }
        }
        catch (e) {
          print("Exception level 1: $e");
          throw e;
        }
      }

      data = Detail(
        statusCode: statusCode, 
        details: details
      );

      final detailsList = detailToJson(data);
      // print("detailsList: $detailsList");
      return detailFromJson(detailsList);

    } catch (e) {
      throw e;
    }
  }
}