import 'package:flutter_sandbox/models/detail.dart';
import 'package:flutter_sandbox/models/selected.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'dart:convert';

import 'package:flutter_sandbox/models/group.dart';

void main(List<String> args) async {
  String htmlData = r"""
  <html><head>
	<meta charset="utf-8">  
    <title>COURSE_ITT610_CAMPUS_M3 </title>
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
<body class="dt-example" cz-shortcut-listen="true">
	<div class="container">
		<section>
            <p></p>
            <hr>
            <p></p>
            <strong>
            COURSE &nbsp; : ITT610<br>CAMPUS : M3    
            </strong>
            <p></p>
            <hr>
            <p></p>
			<div class="demo-html"></div>
            
            
                              
           
                                         
                                            
			<div id="example_wrapper" class="dataTables_wrapper no-footer"><div class="dataTables_length" id="example_length"><label>Show <select name="example_length" aria-controls="example" class=""><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div><div id="example_filter" class="dataTables_filter"><label>Search:<input type="search" class="" placeholder="" aria-controls="example"></label></div><div class="dataTables_scroll"><div class="dataTables_scrollHead" style="overflow: hidden; position: relative; border: 0px; width: 100%;"><div class="dataTables_scrollHeadInner" style="box-sizing: content-box; width: 767.2px; padding-right: 17px;"><table class="display nowrap dataTable no-footer" style="width: 767.2px; margin-left: 0px;" role="grid"><thead>
                                            <tr role="row"><th width="5" class="sorting_asc" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 24.7125px;" aria-sort="ascending" aria-label="NO: activate to sort column descending">NO</th><th width="10" class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 138.375px;" aria-label="DAY TIME: activate to sort column ascending">DAY TIME</th><th width="5" class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 70.625px;" aria-label="GROUP: activate to sort column ascending">GROUP</th><th width="5" class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 92.5125px;" aria-label="MODE: activate to sort column ascending">MODE</th><th width="5" class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 75.6px;" aria-label="STATUS: activate to sort column ascending">STATUS</th><th width="5" class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 149.375px;" aria-label="ROOM: activate to sort column ascending">ROOM</th></tr>
                                            </thead></table></div></div><div class="dataTables_scrollBody" style="position: relative; overflow: auto; width: 100%;"><table id="example" class="display nowrap dataTable no-footer" style="width: 100%;" role="grid" aria-describedby="example_info"><thead>
                                            <tr role="row" style="height: 0px;"><th width="5" class="sorting_asc" aria-controls="example" rowspan="1" colspan="1" style="width: 24.7125px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-sort="ascending" aria-label="NO: activate to sort column descending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">NO</div></th><th width="10" class="sorting" aria-controls="example" rowspan="1" colspan="1" style="width: 138.375px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="DAY TIME: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">DAY TIME</div></th><th width="5" class="sorting" aria-controls="example" rowspan="1" colspan="1" style="width: 70.625px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="GROUP: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">GROUP</div></th><th width="5" class="sorting" aria-controls="example" rowspan="1" colspan="1" style="width: 92.5125px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="MODE: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">MODE</div></th><th width="5" class="sorting" aria-controls="example" rowspan="1" colspan="1" style="width: 75.6px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="STATUS: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">STATUS</div></th><th width="5" class="sorting" aria-controls="example" rowspan="1" colspan="1" style="width: 149.375px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="ROOM: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">ROOM</div></th></tr>
                                            </thead>
                                            
                                            
        
        
                                            <tbody>
                                         
                               
                    
                                            
                                             
                                            
                                             
                                            
                                             
                                            
                                             
 
                                            <tr role="row" class="odd">
                                                <td width="5" class="sorting_1">1.</td>
                                                <td width="5"><strong>MONDAY<br>( <em>10:00 AM-12:00 PM</em> )</strong></td>
                                                <td width="5"><strong>M3CS2556A</strong></td>
                                                <td width="5">BOTH - Fulltime<br>and Part-time</td>
                                                <td width="5">First Timer<br>and Repeater</td>
                                                <td width="5">MAKMAL KOMPUTER 4</td>
                                                
                                                
                                                
                                                 
                                                
                                            </tr><tr role="row" class="even">
                                                <td width="5" class="sorting_1">2.</td>
                                                <td width="5"><strong>MONDAY<br>( <em>10:00 AM-12:00 PM</em> )</strong></td>
                                                <td width="5"><strong>M3CS2556B</strong></td>
                                                <td width="5">BOTH - Fulltime<br>and Part-time</td>
                                                <td width="5">First Timer<br>and Repeater</td>
                                                <td width="5">MAKMAL KOMPUTER 4</td>
                                                
                                                
                                                
                                                 
                                                
                                            </tr><tr role="row" class="odd">
                                                <td width="5" class="sorting_1">3.</td>
                                                <td width="5"><strong>TUESDAY<br>( <em>14:00 PM-16:00 PM</em> )</strong></td>
                                                <td width="5"><strong>M3CS2556A</strong></td>
                                                <td width="5">BOTH - Fulltime<br>and Part-time</td>
                                                <td width="5">First Timer<br>and Repeater</td>
                                                <td width="5"></td>
                                                
                                                
                                                
                                                 
                                                
                                            </tr><tr role="row" class="even">
                                                <td width="5" class="sorting_1">4.</td>
                                                <td width="5"><strong>TUESDAY<br>( <em>14:00 PM-16:00 PM</em> )</strong></td>
                                                <td width="5"><strong>M3CS2556B</strong></td>
                                                <td width="5">BOTH - Fulltime<br>and Part-time</td>
                                                <td width="5">First Timer<br>and Repeater</td>
                                                <td width="5"></td>
                                                
                                                
                                                
                                                 
                                                
                                            </tr></tbody>
                                        </table></div></div><div class="dataTables_info" id="example_info" role="status" aria-live="polite">Showing 1 to 4 of 4 entries</div><div class="dataTables_paginate paging_simple_numbers" id="example_paginate"><a class="paginate_button previous disabled" aria-controls="example" data-dt-idx="0" tabindex="-1" id="example_previous">Previous</a><span><a class="paginate_button current" aria-controls="example" data-dt-idx="1" tabindex="0">1</a></span><a class="paginate_button next disabled" aria-controls="example" data-dt-idx="2" tabindex="-1" id="example_next">Next</a></div></div>
                                   
                            
            
             
            
            
             
             
		</section>
	</div>
	 

<scribe-shadow id="crxjs-ext" style="position: fixed; width: 0px; height: 0px; top: 0px; left: 0px; z-index: 2147483647; overflow: visible;"></scribe-shadow></body></html>
  """;

  var input = [
    Selected(
      campusSelected: "M3-Kampus Jasin", 
      facultySelected: "", 
      courseSelected: "ITT610", 
      courseUrlSelected: 'https://simsweb4.uitm.edu.my/estudent/class_timetable/index_tt.cfm?id1=41543381CCB06AAD41EBA2CC9052C39CC3BC&id2=415CD4B7D57AAB0DC5CDC3D5049641998B95',
      groupSelected: "M3CS2556A"
    )
  ];

  var campusCodeArray = [];
  var facultySelectedArray = [];
  var courseSelectedArray = [];
  var courseUrlSelectedArray = [];
  var groupSelectedArray = [];

  for (var i=0; i<input.length; i++) {
    var counter = input[i];

    campusCodeArray.add(counter.campusSelected.split("-")[0].trim());
    facultySelectedArray.add(counter.facultySelected.split("-")[0].trim());
    courseSelectedArray.add(counter.courseSelected);
    courseUrlSelectedArray.add(counter.courseSelected);
    groupSelectedArray.add(counter.groupSelected);
  }

  var loop = 0;
  var total = 0;
  var newUrl;
  Detail data;
  List<DetailElement> details = [];

  for (var i=0; i<input.length; i++) {
    // get course url here

    var headers = {
      "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36",
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
        var tableCourse = document.querySelectorAll("#example > tbody > tr");

        // collecting all details in the table
        for (var j=0; j<tableCourse.length; j++) {
          final campus = campusCodeArray[i];
          final faculty = facultySelectedArray[i];
          final course = courseSelectedArray[i];
          var group = tableCourse[j].children[2].text.toString().trim();
          final daytime = tableCourse[j].children[1].text.toString().trim();
          final mode = tableCourse[j].children[3].text.toString().trim();
          final status = tableCourse[j].children[4].text.toString().trim();
          final room = tableCourse[j].children[5].text.toString().trim();

          // print(tableCourse[j].children[1].text.toString().trim());
          
          if (group == groupSelectedArray[i]) {
            group = groupSelectedArray[i];

            // day: getting day in DAY TIME column
            // MONDAY

            // bothTime: getting start and end time in DAY TIME column 
            // 14:00 PM-15:00 PM )

            // time: cleaned start and end time
            // 14:00 PM-15:00 PM

            // meridiemStart: getting start time including trailing meridiem
            // 14:00 PM
            // 08:00 AM

            // trailedStart: removing leading zero
            // 8:00 AM

            // start: start time in 24h format
            // 14
            // 8

            final day = daytime.split("(")[0];
            final both_time = daytime.split("(")[1];
            final time = both_time.substring(1, both_time.indexOf(')')).trim();
            // print(day);
            
            var meridiem_start = time.split("-")[0];
            var trailed_start = meridiem_start.replaceAll(RegExp('/^(?:00:)?0?/'), '');
            // var start = int.parse(trailed_start.split(":")[0]);

            var meridiem_end = time.split("-")[1];
            var trailed_end = meridiem_end.replaceAll(RegExp('/^(?:00:)?0?/'), '');
            // var end = int.parse(trailed_end.split(":")[0]);

            final detail_obj = new DetailElement(
              campus: campus, 
              faculty: faculty, 
              course: course, 
              group: group, 
              start: trailed_start, 
              end: trailed_end, 
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

        
      }
      catch (e) {
        print("Exception level 2: $e");
        throw e;
    }
  }
}