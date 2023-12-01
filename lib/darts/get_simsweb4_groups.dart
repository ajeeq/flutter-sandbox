import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'dart:convert';

import 'package:flutter_sandbox/models/group.dart';

void main(List<String> args) async {
  String htmlData = r"""
  <!DOCTYPE html>
    <html>

    <head>
      <meta charset="utf-8">
      <title>COURSE_CSC520_CAMPUS_M3 </title>
      <link rel="stylesheet" type="text/css" href="media/css/jquery.dataTables.css">
      <link rel="stylesheet" type="text/css" href="resources/syntax/shCore.css">
      <link rel="stylesheet" type="text/css" href="resources/demo.css">
      <style type="text/css" class="init">
        div.dataTables_wrapper {
          width: 100%;
          height: 100%;
          margin: 1 auto;
        }
      </style>
      <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
      <script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
      <script type="text/javascript" language="javascript" class="init">
        $(document).ready(function() {
      $('#example').DataTable( {
        "scrollX": true,
            "responsive": true
      } );
    } );

      </script>
    </head>

    <body class="dt-example">
      <div class="container">
        <section>
          <p></p>
          <hr>
          <p></p>
          <strong>
                COURSE &nbsp; : CSC520<BR>CAMPUS : M3    
                </strong>
          <p></p>
          <hr>
          <p></p>
          <div class="demo-html"></div>






          <table id="example" class="display nowrap" style="width:100%">

            <thead>
              <tr>
                <th width="5">NO</th>
                <th width="10">DAY TIME</th>
                <th width="5">GROUP</th>
                <th width="5">MODE</th>
                <th width="5">STATUS</th>
                <th width="5">ROOM</th>




              </tr>
            </thead>


            <tbody>



              <tr>
                <td width="5">1.</td>
                <td width="5"><strong>MONDAY<BR>( <em>10:00 AM-12:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2303B</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5">DEWAN SEMINAR 2B</td>





              </tr>

              <tr>
                <td width="5">2.</td>
                <td width="5"><strong>MONDAY<BR>( <em>14:00 PM-16:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2303C</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5">DEWAN KULIAH A</td>





              </tr>

              <tr>
                <td width="5">3.</td>
                <td width="5"><strong>MONDAY<BR>( <em>14:00 PM-16:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2533A</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5"></td>





              </tr>

              <tr>
                <td width="5">4.</td>
                <td width="5"><strong>MONDAY<BR>( <em>14:00 PM-16:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2533B</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5">DEWAN SEMINAR 1A</td>





              </tr>

              <tr>
                <td width="5">5.</td>
                <td width="5"><strong>TUESDAY<BR>( <em>16:00 PM-18:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2303A</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5">BILIK TUTORIAL 01</td>





              </tr>

              <tr>
                <td width="5">6.</td>
                <td width="5"><strong>TUESDAY<BR>( <em>16:00 PM-18:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2303B</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5"></td>





              </tr>

              <tr>
                <td width="5">7.</td>
                <td width="5"><strong>TUESDAY<BR>( <em>14:00 PM-16:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2513C</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5">BILIK TUTORIAL 03</td>





              </tr>

              <tr>
                <td width="5">8.</td>
                <td width="5"><strong>TUESDAY<BR>( <em>16:00 PM-18:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2533B</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5"></td>





              </tr>

              <tr>
                <td width="5">9.</td>
                <td width="5"><strong>TUESDAY<BR>( <em>14:00 PM-16:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2533C</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5"></td>





              </tr>

              <tr>
                <td width="5">10.</td>
                <td width="5"><strong>WEDNESDAY<BR>( <em>10:00 AM-12:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2533C</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5">BILIK TUTORIAL 05</td>





              </tr>

              <tr>
                <td width="5">11.</td>
                <td width="5"><strong>THURSDAY<BR>( <em>14:00 PM-16:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2303A</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5"></td>





              </tr>

              <tr>
                <td width="5">12.</td>
                <td width="5"><strong>THURSDAY<BR>( <em>16:00 PM-18:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2303C</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5"></td>





              </tr>

              <tr>
                <td width="5">13.</td>
                <td width="5"><strong>THURSDAY<BR>( <em>10:00 AM-12:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2533A</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5">BILIK KULIAH 18</td>





              </tr>

              <tr>
                <td width="5">14.</td>
                <td width="5"><strong>FRIDAY<BR>( <em>10:00 AM-12:00 PM</em> )</strong></td>
                <td width="5"><strong>M3CS2513C</strong></td>
                <td width="5">Fulltime</td>
                <td width="5">First Timer<br>and Repeater</td>
                <td width="5"></td>





              </tr>


            </tbody>
          </table>








        </section>
      </div>

    </body>

    </html>
  """;


  var input = json.encode({
    'campusInputUser': 'B - UiTM Kampus Shah Alam',
    'facultyInputUser': 'AP - FACULTY OF ARCHITECTURE, PLANNING & SURVEYING',
    'courseInputUser': 'PMG610'
  });
  // var campusInput = json.decode(input).campusInputUser;
  // var facultyInput = json.decode(input).facultyInputUser;
  // var courseInput = json.decode(input).courseInputUser;

  // var campusCode = campusInput.split("-")[0].trim();
  // var facultyCode = facultyInput.split("-")[0].trim();
  // var courseCode = courseInput;

  var campusCode = "B";
  var facultyCode = "";
  var courseCode = "PMG610";

  var groupDuplicated = [];
  Group data;
  List<GroupElement> groups = [];

  final url = Uri.parse("https://simsweb4.uitm.edu.my/estudent/class_timetable/index_tt.cfm?id1=5C0496B1F1A5A489D9EF22CD045CA25F0A18&id2=415CD497F950983A8BCDC711707D9BBD486C");
  var groupListUri;
  var headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36",
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
    'content-type': 'application/x-www-form-urlencoded',
  };

  // HTTP EXAMPLE WITH HEADERS:
  final response = await http.get(url, headers: headers);
  // Status Code 200 means response has been received successfully
  try {
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);

      try {
        // fetching course code list
        var tableCourse = document.querySelectorAll("#example > tbody > tr");

        // id and group
        for (var i=1; i<tableCourse.length; i++) {
          groupDuplicated.add(tableCourse[i].children[2].text.toString().trim());
        }

        var distinct = groupDuplicated.toSet().toList();

        var group_obj;
        distinct.forEach((element) {
          final id = distinct.indexOf(element);
          final group = element;
          group_obj = new GroupElement(id: id, group: group);
          groups.add(group_obj);
        });
        // print(groupDuplicated);

        data = Group(
          statusCode: response.statusCode,
          groups: groups
        );

        final groupList = groupToJson(data);
        print(groupList);
      }
      catch (e) {
        print("Exception level 2: $e");
        throw e;
      }
    }
    else {
      print("No redirect.");
      print("Status Code - " + (response.statusCode).toString());
      final groupList = null;
      return groupList;
    }
   
  } catch (e) {
    print("Exception level 1: $e");
  }
}
