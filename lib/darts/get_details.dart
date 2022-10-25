import 'package:flutter_sandbox/models/detail.dart';
import 'package:flutter_sandbox/models/selected.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'dart:convert';

import 'package:flutter_sandbox/models/group.dart';

void main(List<String> args) async {
  String htmlData = """
             <html>
              <head>

                <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
                <meta http-equiv="Pragma" content="no-cache">
                <meta http-equiv="Expires" content="0">

 
            <body>  
                 

                
                <table   cellpadding="3" 
                        style="BORDER-COLLAPSE: collapse" 
                              bordercolor="#cccccc"  
                              cellpadding="0" width="100%" border="1" 
                       class="table table-bordered table-striped table-hover"  >
                    
                  <tbody>
                      <tr  bgcolor="#D9D8D8"  >
                      <td  style="font-family:arial;font-size:17px"  colspan="8" align="left"> 
                          <strong> 
                              Campus : Selangor, Faculty : AP - Course : PMG610
                          </strong><BR> Valid as 20/10/2022 17:30:01  
                          
                          </td> 
                    </tr>
                    <tr>
                      <td  style="font-family:arial;font-size:13px"  align="center">NO</td>
                      <td  style="font-family:arial;font-size:13px"  align="center">DAY TIME</td>
                      <td  style="font-family:arial;font-size:13px"  align="center">GROUP</td> 
                      <td  style="font-family:arial;font-size:13px"  align="center">MODE</td>
                      <td  style="font-family:arial;font-size:13px"  align="center">STATUS</td>
                      <td  style="font-family:arial;font-size:13px"  align="center">ROOM</td>
                    </tr>
                      
          
                        <tr 
                            
                                bgcolor="#F0EEEE"        
                             
                            >
                          <td  style="font-family:arial;font-size:13px"  align="center">1.</td>
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>MONDAY<BR>( <em>14:00 PM-15:00 PM</em> )</strong></td>
                          
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>AP2305A</strong></td>
                          <td  style="font-family:arial;font-size:13px"  align="center">BOTH - Fulltime and Part-time</td>
                          <td  style="font-family:arial;font-size:13px"  align="center">First Timer and Repeater</td> 
                          <td  style="font-family:arial;font-size:13px"  align="center">Dewan Kuliah FSPU</td>
                        </tr>
                      
          
                        <tr 
                             
                            >
                          <td  style="font-family:arial;font-size:13px"  align="center">2.</td>
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>MONDAY<BR>( <em>15:00 PM-17:00 PM</em> )</strong></td>
                          
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>AP2305A</strong></td>
                          <td  style="font-family:arial;font-size:13px"  align="center">BOTH - Fulltime and Part-time</td>
                          <td  style="font-family:arial;font-size:13px"  align="center">First Timer and Repeater</td> 
                          <td  style="font-family:arial;font-size:13px"  align="center">Dewan Kuliah FSPU</td>
                        </tr>
                      
          
                        <tr 
                            
                                bgcolor="#F0EEEE"        
                             
                            >
                          <td  style="font-family:arial;font-size:13px"  align="center">3.</td>
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>MONDAY<BR>( <em>14:00 PM-15:00 PM</em> )</strong></td>
                          
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>AP2305B</strong></td>
                          <td  style="font-family:arial;font-size:13px"  align="center">BOTH - Fulltime and Part-time</td>
                          <td  style="font-family:arial;font-size:13px"  align="center">First Timer and Repeater</td> 
                          <td  style="font-family:arial;font-size:13px"  align="center">Dewan Kuliah FSPU</td>
                        </tr>
                      
          
                        <tr 
                             
                            >
                          <td  style="font-family:arial;font-size:13px"  align="center">4.</td>
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>MONDAY<BR>( <em>15:00 PM-17:00 PM</em> )</strong></td>
                          
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>AP2305B</strong></td>
                          <td  style="font-family:arial;font-size:13px"  align="center">BOTH - Fulltime and Part-time</td>
                          <td  style="font-family:arial;font-size:13px"  align="center">First Timer and Repeater</td> 
                          <td  style="font-family:arial;font-size:13px"  align="center">Dewan Kuliah FSPU</td>
                        </tr>
                      
          
                        <tr 
                            
                                bgcolor="#F0EEEE"        
                             
                            >
                          <td  style="font-family:arial;font-size:13px"  align="center">5.</td>
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>MONDAY<BR>( <em>14:00 PM-15:00 PM</em> )</strong></td>
                          
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>AP2305C</strong></td>
                          <td  style="font-family:arial;font-size:13px"  align="center">BOTH - Fulltime and Part-time</td>
                          <td  style="font-family:arial;font-size:13px"  align="center">First Timer and Repeater</td> 
                          <td  style="font-family:arial;font-size:13px"  align="center">Dewan Kuliah FSPU</td>
                        </tr>
                      
          
                        <tr 
                             
                            >
                          <td  style="font-family:arial;font-size:13px"  align="center">6.</td>
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>MONDAY<BR>( <em>15:00 PM-17:00 PM</em> )</strong></td>
                          
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>AP2305C</strong></td>
                          <td  style="font-family:arial;font-size:13px"  align="center">BOTH - Fulltime and Part-time</td>
                          <td  style="font-family:arial;font-size:13px"  align="center">First Timer and Repeater</td> 
                          <td  style="font-family:arial;font-size:13px"  align="center">Dewan Kuliah FSPU</td>
                        </tr>
                      
          
                        <tr 
                            
                                bgcolor="#F0EEEE"        
                             
                            >
                          <td  style="font-family:arial;font-size:13px"  align="center">7.</td>
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>THURSDAY<BR>( <em>09:00 AM-10:00 AM</em> )</strong></td>
                          
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>AP2305A</strong></td>
                          <td  style="font-family:arial;font-size:13px"  align="center">BOTH - Fulltime and Part-time</td>
                          <td  style="font-family:arial;font-size:13px"  align="center">First Timer and Repeater</td> 
                          <td  style="font-family:arial;font-size:13px"  align="center">Dewan Kuliah FSPU</td>
                        </tr>
                      
          
                        <tr 
                             
                            >
                          <td  style="font-family:arial;font-size:13px"  align="center">8.</td>
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>THURSDAY<BR>( <em>10:00 AM-12:00 PM</em> )</strong></td>
                          
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>AP2305A</strong></td>
                          <td  style="font-family:arial;font-size:13px"  align="center">BOTH - Fulltime and Part-time</td>
                          <td  style="font-family:arial;font-size:13px"  align="center">First Timer and Repeater</td> 
                          <td  style="font-family:arial;font-size:13px"  align="center">Dewan Kuliah FSPU</td>
                        </tr>
                      
          
                        <tr 
                            
                                bgcolor="#F0EEEE"        
                             
                            >
                          <td  style="font-family:arial;font-size:13px"  align="center">9.</td>
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>THURSDAY<BR>( <em>09:00 AM-10:00 AM</em> )</strong></td>
                          
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>AP2305B</strong></td>
                          <td  style="font-family:arial;font-size:13px"  align="center">BOTH - Fulltime and Part-time</td>
                          <td  style="font-family:arial;font-size:13px"  align="center">First Timer and Repeater</td> 
                          <td  style="font-family:arial;font-size:13px"  align="center">Dewan Kuliah FSPU</td>
                        </tr>
                      
          
                        <tr 
                             
                            >
                          <td  style="font-family:arial;font-size:13px"  align="center">10.</td>
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>THURSDAY<BR>( <em>10:00 AM-12:00 PM</em> )</strong></td>
                          
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>AP2305B</strong></td>
                          <td  style="font-family:arial;font-size:13px"  align="center">BOTH - Fulltime and Part-time</td>
                          <td  style="font-family:arial;font-size:13px"  align="center">First Timer and Repeater</td> 
                          <td  style="font-family:arial;font-size:13px"  align="center">Dewan Kuliah FSPU</td>
                        </tr>
                      
          
                        <tr 
                            
                                bgcolor="#F0EEEE"        
                             
                            >
                          <td  style="font-family:arial;font-size:13px"  align="center">11.</td>
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>THURSDAY<BR>( <em>09:00 AM-10:00 AM</em> )</strong></td>
                          
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>AP2305C</strong></td>
                          <td  style="font-family:arial;font-size:13px"  align="center">BOTH - Fulltime and Part-time</td>
                          <td  style="font-family:arial;font-size:13px"  align="center">First Timer and Repeater</td> 
                          <td  style="font-family:arial;font-size:13px"  align="center">Dewan Kuliah FSPU</td>
                        </tr>
                      
          
                        <tr 
                             
                            >
                          <td  style="font-family:arial;font-size:13px"  align="center">12.</td>
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>THURSDAY<BR>( <em>10:00 AM-12:00 PM</em> )</strong></td>
                          
                          <td  style="font-family:arial;font-size:13px"  align="center"><strong>AP2305C</strong></td>
                          <td  style="font-family:arial;font-size:13px"  align="center">BOTH - Fulltime and Part-time</td>
                          <td  style="font-family:arial;font-size:13px"  align="center">First Timer and Repeater</td> 
                          <td  style="font-family:arial;font-size:13px"  align="center">Dewan Kuliah FSPU</td>
                        </tr>
                    
                  </tbody>
                </table> 
   
              </body>
              </html>  	
            

  """;

  var input = [
    Selected(campusSelected: "B-Kampus Shah Alam", facultySelected: "AP", courseSelected: "PMG610", groupSelected: "AP2305A"),
  ];
  final url = "https://icress.uitm.edu.my/timetable1/list/";

  var campusCodeArray = [];
  var facultySelectedArray = [];
  var courseSelectedArray = [];
  var groupSelectedArray = [];

  for (var i=0; i<input.length; i++) {
    var counter = input[i];

    campusCodeArray.add(counter.campusSelected.split("-")[0].trim());
    facultySelectedArray.add(counter.facultySelected.split("-")[0].trim());
    courseSelectedArray.add(counter.courseSelected);
    groupSelectedArray.add(counter.groupSelected);
  }

  var loop = 0;
  var total = 0;
  var newUrl;
  Detail data;
  List<DetailElement> details = [];

  for (var i=0; i<input.length; i++) {
    if (campusCodeArray[i] == "B") {
        newUrl = url + "B/" + facultySelectedArray[i] + "/" + courseSelectedArray[i] + ".html";
        // print("\nNewUrl: " + newUrl);
    }
    else {
        newUrl = url + campusCodeArray[i] + "/" + courseSelectedArray[i] + ".html";
        // print("\nNewUrl: " + newUrl);
    }

    final baseUrl = "https://icress.uitm.edu.my/timetable1/list/";
    var headers = {
      "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36",
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
      'content-type': 'application/x-www-form-urlencoded',
    };


      // HTTP EXAMPLE WITH HEADERS:
      // final response = await http.get(Uri.parse("https://icress.uitm.edu.my/timetable1/list/B/CS/CSC520.html"), headers: headers);
      // Status Code 200 means response has been received successfully
      // try {
    
      var document = parser.parse(htmlData);

      try {
        loop++;
        var count = 0;
        
        // fetching date validity
        // var tableCourseValid = document.querySelectorAll("body > table > tbody > tr");
        // final thead = tableCourseValid[0].children[0].text.toString().trim().split("<br>")[0];
        // final theadParts = thead.split("as");
        // validity = theadParts[1].trim();

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
            final both_time = daytime.split("(")[1];
            final time = both_time.substring(1, both_time.indexOf(')')).trim();
            
            var meridiem_start = time.split("-")[0];
            var trailed_start = meridiem_start.replaceAll(RegExp('/^(?:00:)?0?/'), '');
            var start = int.parse(trailed_start.split(":")[0]);

            var meridiem_end = time.split("-")[1];
            var trailed_end = meridiem_end.replaceAll(RegExp('/^(?:00:)?0?/'), '');
            var end = int.parse(trailed_end.split(":")[0]);

            final detail_obj = new DetailElement(
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
            details.add(detail_obj);
            count++;
          }
        }
        total += count;
        data = Detail(
          statusCode: 200, 
          details: details
        );
        print(detailToJson(data));

        // var distinct = groupDuplicated.toSet().toList();

        // var group_obj;
        // distinct.forEach((element) {
        //   final id = distinct.indexOf(element);
        //   final group = element;
        //   group_obj = new GroupElement(id: id, group: group);
        //   groups.add(group_obj);
        // });
        // print(groupDuplicated);

        // data = Group(
        //   valid: validity,
        //   statusCode: response.statusCode,
        //   groups: groups
        // );

      //   final groupList = groupToJson(data);
      //   print((groupList));
      }
      catch (e) {
        print("Exception level 2: $e");
        throw e;
    }
  }
    // }
    // else {
    //   print("No redirect.");
    //   print("Status Code - " + (response.statusCode).toString());
    //   final groupList = null;
    //   return groupList;
    // }
   
  // } catch (e) {
  //   print("Exception level 1: $e");
  // }

















//   final url = "https://icress.uitm.edu.my/timetable1/list/";

//   final campusInput = "A - UiTM Kampus Seri Iskandar";
//   final facultyInput = "";
//   final courseInput = "ELC121";
//   var groupListUri = "";

//   var campusCode = campusInput.split("-")[0].trim();
//   var facultyCode = facultyInput.split("-")[0].trim();
//   var courseCode = courseInput;

//   if (campusCode == "B") {
//       groupListUri = url + "B/" + facultyCode + "/" + courseCode + ".html";
//       // print("\nGroup link url: " + groupListUri);
//   }
//   else {
//       groupListUri = url + campusCode + "/" + courseCode + ".html";
//       // print("\nGroup link url: " + groupListUri);
//   }

//   var document = parser.parse(htmlData);
//   var groupDuplicated = [];
//   Group data;
//   List<GroupElement> groups = [];

//   try {
//     // fetching date validity
//     var tableCourseValid = document.querySelectorAll("body > table > tbody > tr");
//     final thead = tableCourseValid[0].children[0].text.toString().trim().split("<br>")[0];
//     final theadParts = thead.split("as");
//     final validity = theadParts[1].trim();
//     // print(validity);

//     // fetching course code list
//     var tableCourse = document.querySelectorAll("body > table > tbody > tr");
//     // final trs = tableCourse[0].children[0].text.toString().trim().split("<br>")[0];
//     // var trs = tableCourse.querySelectorAll("tr");
//     // var tds = tableCourse.("td");
//     // const tds = $(element).find("td");

//     // id
//     // for (var i=2; i<tableCourse.length-2; i++) {
//     //   groupDuplicated.add(i-2);
//     // }
//     // group
//     for (var i=2; i<tableCourse.length-2; i++) {
//       groupDuplicated.add(tableCourse[i].children[2].text.toString().trim());
//     }

//     var distinct = groupDuplicated.toSet().toList();
//     final List uniqueList = Set.from(groupDuplicated).toList();


//     // distinct.map((val) {
//     //     print(distinct.indexOf(val));

//     //     // return something;
//     // });

//     var group_obj;
//     distinct.forEach((element) {
//       final id = distinct.indexOf(element);
//       final group = element;
//       group_obj = new GroupElement(id: id, group: group);
//       groups.add(group_obj);
//     });
//     print(groups);

//     data = Group(
//       valid: valid,
//       statusCode: statusCode,
//       groups: groups
//     );

//     final groupList = groupToJson(data);
//     print(groupList);

//     // distinct.asMap().entries.map((entry) {
//     //   int idx = entry.key;
//     //   String val = entry.value;

//     //   print(entry.value.toString());
//     // });
   
//     // var map1 = {};
//     // Map map2 = {for (var item in distinct)  : '$item'};
//     // var map1 = Map.fromIterable(distinct, key: (e) => index, value: (e) => e);
//     // print(map1);


//     // for (var i=0; i<trCourse!.length; i++) {
//     //   final num = trCourse[i].text;
//     //   final course = trCourse[i].text.trim();
//     //   var course_obj = new CourseElement(num: num, course: course);
//     //   courses.add(course_obj);
      
//     // }

//     // final campusList = courseToJson(Course(statusCode: response.statusCode, courses: courses));
    

//    }
//     catch (e) {
//      throw e;
//    }
}