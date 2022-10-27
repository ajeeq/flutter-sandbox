import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

import 'package:flutter_sandbox/models/campus_faculty.dart';

void main(List<String> args) async {
  String htmlData = """ <!-- saved from url=(0048)https://icress.uitm.edu.my/timetable_/search.asp -->
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script language="Javascript">

      function NewWindow(mypage, myname, w, h, scroll) {
      var winl = (screen.width - w) / 2;
      var wint = (screen.height - h) / 2;
      winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable=no'
      win = window.open(mypage, myname, winprops)
      if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
      }
    </script>

    <!-- Required meta tags -->

    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--favicon-->
    <link
      rel="icon"
      href="https://icress.uitm.edu.my/timetable_/assets/images/favicon-32x32.png"
      type="image/png"
    />
    <!-- loader-->
    <!--plugins-->
    <link href="./campus_files/simplebar.css" rel="stylesheet" />
    <link href="./campus_files/perfect-scrollbar.css" rel="stylesheet" />
    <link href="./campus_files/metisMenu.min.css" rel="stylesheet" />
    <link
      href="./campus_files/dataTables.bootstrap5.min.css"
      rel="stylesheet"
    />
    <!-- loader-->
    <link href="./campus_files/pace.min.css" rel="stylesheet" />
    <script src="./campus_files/pace.min.js.download"></script>
    <!-- Bootstrap CSS -->
    <link href="./campus_files/bootstrap.min.css" rel="stylesheet" />
    <link href="./campus_files/css2" rel="stylesheet" />
    <link href="./campus_files/app.css" rel="stylesheet" />
    <link href="./campus_files/icons.css" rel="stylesheet" />
    <title>UiTM Timetable</title>
  </head>

  <body class="bg-theme bg-theme1 pace-done" cz-shortcut-listen="true">
    <div class="pace pace-inactive">
      <div
        class="pace-progress"
        data-progress-text="100%"
        data-progress="99"
        style="transform: translate3d(100%, 0px, 0px);"
      >
        <div class="pace-progress-inner"></div>
      </div>
      <div class="pace-activity"></div>
    </div>
    <!-- wrapper -->
    <div class="wrapper">
      <div class="card shadow-none bg-transparent">
        <div class="col-xl-9 mx-auto">
          <hr />
          <h6 class="mb-0 text-uppercase">Search Timetable UiTM</h6>
          <hr />
          <div class="card">
            <div class="card-body">
              <div class="p-4 border rounded">
                <form
                  ty=""
                  class="row g-3"
                  action="https://icress.uitm.edu.my/timetable_/search.asp"
                  method="post"
                >
                  <div class="col-md-5 position-relative">
                    <label class="form-label">Campus</label>

                    <select
                      class="form-select"
                      name="yNTU2NDgiiLCJzY29wZSI6Ii9llbGFzdG"
                      id="search_campus"
                    >
                      <option selected="" value="">Choose a Campus...</option>

                      <option value="B">
                        B-SELANGOR CAMPUS - ( Please Select a Faculty )
                      </option>

                      <option value="APB">
                        APB-SELANGOR CAMPUS - LANGUAGE COURSES
                      </option>

                      <option value="CITU">
                        CITU-SELANGOR CAMPUS - CITU COURSES
                      </option>

                      <option value="HEP">
                        HEP-SELANGOR CAMPUS - CO-CURRICULUM COURSES
                      </option>

                      <option value="A">A-UITM KAMPUS SERI ISKANDAR</option>

                      <option value="A4">A4-UITM KAMPUS TAPAH</option>

                      <option value="B">B-UITM SHAH ALAM</option>

                      <option value="B10">B10-UITM KAMPUS DENGKIL</option>

                      <option value="B11">B11-UITM KAMPUS SUNGAI BULOH</option>

                      <option value="B6">
                        B6-UITM KAMPUS HOSPITAL SG. BULOH
                      </option>

                      <option value="B8">B8-UITM KAMPUS PUNCAK ALAM</option>

                      <option value="B9">B9-UITM KAMPUS PUNCAK PERDANA</option>

                      <option value="C">C-UITM KAMPUS JENGKA</option>

                      <option value="C3">C3-UITM KAMPUS RAUB</option>

                      <option value="D">D-UITM KAMPUS MACHANG</option>

                      <option value="D2">D2-UITM KAMPUS KOTA BHARU</option>

                      <option value="FAB">FAB-KOLEJ WIDAD</option>

                      <option value="FD">FD-KOLEJ UNIKOP</option>

                      <option value="FEW">
                        FEW-EAST WEST INTERNATIONAL COLLEGE
                      </option>

                      <option value="FFE">FFE-KOLEJ FELCRA</option>

                      <option value="FJ">
                        FJ-KOLEJ ISLAM YAYASAN PELAJARAN JOHOR
                      </option>

                      <option value="FJA">
                        FJA-INSTITUT SAINS DAN TEK. DARUL TAKZIM
                      </option>

                      <option value="FL">
                        FL-INS. PROFESIONAL BAITULMAL KUALA LUMPUR
                      </option>

                      <option value="FM">FM-KOLEJ ANTARABANGSA UNIFIELD</option>

                      <option value="FN">FN-KOLEJ UNITI</option>

                      <option value="FQ">FQ-KOLEJ SATT</option>

                      <option value="FQI">
                        FQI-QAIWAN INTERNATIONAL UNIVERSITY
                      </option>

                      <option value="J">J-UITM KAMPUS SEGAMAT</option>

                      <option value="J4">J4-UITM KAMPUS PASIR GUDANG</option>

                      <option value="K">K-UITM KAMPUS SUNGAI PETANI</option>

                      <option value="M">M-UITM KAMPUS ALOR GAJAH</option>

                      <option value="M1">
                        M1-UITM KAMPUS BANDARAYA MELAKA
                      </option>

                      <option value="M3">M3-UITM KAMPUS JASIN</option>

                      <option value="N3">N3-UITM KAMPUS KUALA PILAH</option>

                      <option value="N4">N4-UITM KAMPUS SEREMBAN 3</option>

                      <option value="N5">N5-UITM KAMPUS REMBAU</option>

                      <option value="P">P-UITM KAMPUS BUKIT MERTAJAM</option>

                      <option value="P2">P2-UITM KAMPUS BERTAM</option>

                      <option value="P4">P4-UITM KAMPUS PERMATANG PAUH</option>

                      <option value="Q">Q-UITM KAMPUS SAMARAHAN</option>

                      <option value="Q5">Q5-UITM KAMPUS SAMARAHAN 2</option>

                      <option value="Q6">Q6-UITM KAMPUS MUKAH</option>

                      <option value="R">R-UITM KAMPUS ARAU</option>

                      <option value="S">S-UITM KAMPUS KOTA KINABALU</option>

                      <option value="S2">S2-UITM KAMPUS TAWAU</option>

                      <option value="T">T-UITM KAMPUS DUNGUN</option>

                      <option value="T4">T4-UITM KAMPUS BUKIT BESI</option>

                      <option value="T5">
                        T5-UITM KAMPUS KUALA TERENGGANU (CENDERING)
                      </option>
                    </select>
                  </div>
                  <div class="col-md-5 position-relative">
                    <label for="validationTooltip02" class="form-label"
                      >Faculty</label
                    >

                    <select
                      class="form-select"
                      name="eyJ0eXAiOiiJKV1QiLCJhbGciOiJIUzI1NiJ9"
                      id="search_faculty"
                    >
                      <option selected="" value="">
                        Choose a Faculty (For Campus B Student Only)
                      </option>

                      <option value="AA">
                        AA-ARSHAD AYUB GRADUATE BUSINESS SCHOOL
                      </option>

                      <option value="AC">AC-FACULTY OF ACCOUNTANCY</option>

                      <option value="AD">AD-FACULTY OF ART AND DESIGN</option>

                      <option value="AM">
                        AM-FACULTY OF ADMINISTRATIVE SCIENCE AND POLICY STUDIES
                      </option>

                      <option value="AP">
                        AP-FACULTY OF ARCHITECTURE PLANNING AND SURVEYING
                      </option>

                      <option value="AS">AS-FACULTY OF APPLIED SCIENCES</option>

                      <option value="BA">
                        BA-FACULTY OF BUSINESS AND MANAGEMENT
                      </option>

                      <option value="BM">
                        BM-FACULTY OF BUSINESS MANAGEMENT
                      </option>

                      <option value="CA">CA-COLLEGE OF CREATIVE ARTS</option>

                      <option value="CE">CE-COLLEGE OF ENGINEERING</option>

                      <option value="CS">
                        CS-FACULTY OF COMPUTER AND MATHEMATICAL SCIENCES
                      </option>

                      <option value="DS">DS-FACULTY OF DENTISTRY</option>

                      <option value="EC">
                        EC-FACULTY OF CIVIL ENGINEERING
                      </option>

                      <option value="ED">ED-FACULTY OF EDUCATION</option>

                      <option value="EE">
                        EE-FACULTY OF ELECTRICAL ENGINEERING
                      </option>

                      <option value="EH">
                        EH-FACULTY OF CHEMICAL ENGINEERING
                      </option>

                      <option value="EM">
                        EM-FACULTY OF MECHANICAL ENGINEERING
                      </option>

                      <option value="FF">
                        FF-FACULTY OF FILM THEATRE AND ANIMATION
                      </option>

                      <option value="HM">
                        HM-FACULTY OF HOTEL AND TOURISM MANAGEMENT
                      </option>

                      <option value="HS">HS-FACULTY OF HEALTH SCIENCES</option>

                      <option value="IC">
                        IC-ACADEMY OF CONTEMPORARY ISLAMIC STUDIES
                      </option>

                      <option value="IM">
                        IM-FACULTY OF INFORMATION MANAGEMENT
                      </option>

                      <option value="IN">IN-INTERNATIONAL</option>

                      <option value="LG">LG-ACADEMY OF LANGUAGE STUDIES</option>

                      <option value="LT">
                        LT-MALAYSIA INSTITUTE OF TRANSPORT
                      </option>

                      <option value="LW">LW-FACULTY OF LAW</option>

                      <option value="MC">
                        MC-FACULTY OF COMMUNICATION AND MEDIA STUDIES
                      </option>

                      <option value="MU">MU-FACULTY OF MUSIC</option>

                      <option value="PH">PH-FACULTY OF PHARMACY</option>

                      <option value="SR">
                        SR-FACULTY OF SPORTS SCIENCE AND RECREATION
                      </option>
                    </select>
                  </div>

                  <div class="col-12">
                    <button class="btn btn-light" type="submit">
                      Display Course Timetable
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="wrapper">
      <div class="card shadow-none bg-transparent">
        <div class="col-xl-9 mx-auto">
          <div class="card">
            <div class="card-body">
              <div class="p-4 border rounded">
                <div class="table-responsive">
                  <div
                    id="example2_wrapper"
                    class="dataTables_wrapper dt-bootstrap5 no-footer"
                  >
                    <div class="row">
                      <div class="col-sm-12 col-md-6"></div>
                      <div class="col-sm-12 col-md-6">
                        <div id="example2_filter" class="dataTables_filter">
                          <label
                            >Search:<input
                              type="search"
                              class="form-control form-control-sm"
                              placeholder=""
                              aria-controls="example2"
                          /></label>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-12">
                        <table
                          id="example2"
                          class="table table-striped table-bordered dataTable no-footer"
                          role="grid"
                          aria-describedby="example2_info"
                        >
                          <thead>
                            <tr role="row">
                              <th
                                width="20px"
                                class="sorting_asc"
                                tabindex="0"
                                aria-controls="example2"
                                rowspan="1"
                                colspan="1"
                                aria-sort="ascending"
                                aria-label="No: activate to sort column descending"
                                style="width: 21.475px;"
                              >
                                No
                              </th>
                              <th
                                width="80px"
                                class="sorting"
                                tabindex="0"
                                aria-controls="example2"
                                rowspan="1"
                                colspan="1"
                                aria-label="Course: activate to sort column ascending"
                                style="width: 80px;"
                              >
                                Course
                              </th>
                              <th
                                class="sorting"
                                tabindex="0"
                                aria-controls="example2"
                                rowspan="1"
                                colspan="1"
                                aria-label="Action: activate to sort column ascending"
                                style="width: 851.525px;"
                              >
                                Action
                              </th>
                            </tr>
                          </thead>

                          <tbody>
                            <tr class="odd">
                              <td
                                valign="top"
                                colspan="3"
                                class="dataTables_empty"
                              >
                                No data available in table
                              </td>
                            </tr>
                          </tbody>
                          <tbody></tbody>
                        </table>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-12 col-md-5">
                        <div
                          class="dataTables_info"
                          id="example2_info"
                          role="status"
                          aria-live="polite"
                        >
                          Showing 0 to 0 of 0 entries
                        </div>
                      </div>
                      <div class="col-sm-12 col-md-7">
                        <div
                          class="dataTables_paginate paging_simple_numbers"
                          id="example2_paginate"
                        >
                          <ul class="pagination">
                            <li
                              class="paginate_button page-item previous disabled"
                              id="example2_previous"
                            >
                              <a
                                href="https://icress.uitm.edu.my/timetable_/search.asp#"
                                aria-controls="example2"
                                data-dt-idx="0"
                                tabindex="0"
                                class="page-link"
                                >Prev</a
                              >
                            </li>
                            <li
                              class="paginate_button page-item next disabled"
                              id="example2_next"
                            >
                              <a
                                href="https://icress.uitm.edu.my/timetable_/search.asp#"
                                aria-controls="example2"
                                data-dt-idx="1"
                                tabindex="0"
                                class="page-link"
                                >Next</a
                              >
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- end wrapper -->
    <!--start switcher-->
    <div class="switcher-wrapper">
      <div class="switcher-btn"><i class="bx bx-cog bx-spin"></i></div>
      <div class="switcher-body">
        <div class="d-flex align-items-center">
          <h5 class="mb-0 text-uppercase">Theme Customizer</h5>
          <button
            type="button"
            class="btn-close ms-auto close-switcher"
            aria-label="Close"
          ></button>
        </div>
        <hr />
        <p class="mb-0">Gaussian Texture</p>
        <hr />
        <ul class="switcher">
          <li id="theme1"></li>
          <li id="theme2"></li>
          <li id="theme3"></li>
          <li id="theme4"></li>
          <li id="theme5"></li>
          <li id="theme6"></li>
        </ul>
        <hr />
        <p class="mb-0">Gradient Background</p>
        <hr />
        <ul class="switcher">
          <li id="theme7"></li>
          <li id="theme8"></li>
          <li id="theme9"></li>
          <li id="theme10"></li>
          <li id="theme11"></li>
          <li id="theme12"></li>
          <li id="theme13"></li>
          <li id="theme14"></li>
          <li id="theme15"></li>
        </ul>
      </div>
    </div>
    <!--end switcher-->
    <!--plugins-->

    <!--end switcher-->
    <!-- Bootstrap JS -->
    <script src="./campus_files/bootstrap.bundle.min.js.download"></script>
    <!--plugins-->
    <script src="./campus_files/jquery.min.js.download"></script>
    <script src="./campus_files/simplebar.min.js.download"></script>
    <script src="./campus_files/metisMenu.min.js.download"></script>
    <script src="./campus_files/perfect-scrollbar.js.download"></script>
    <script src="./campus_files/jquery.dataTables.min.js.download"></script>
    <script src="./campus_files/dataTables.bootstrap5.min.js.download"></script>

    
    <!--app JS-->
    <script src="./campus_files/app.js.download"></script>
  </body>
</html>
 """;

  var url = Uri.parse('https://icress.uitm.edu.my/timetable/search.asp');
  var headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36",
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
    'content-type': 'application/x-www-form-urlencoded',
  };

  // HTTP EXAMPLE WITH HEADERS:
  final response = await http.get(url, headers: headers);
  Campus data;
  List<CampusElement> campuses = [];
  List<FacultyElement> faculties = [];
  
  try {
    if (response.statusCode == 200) {
      // print("Response:");
      // print("Status: ${response.statusCode}");
      // print("Header: ${json.encode(response.headers)}");
      // print("Data: ${(response.body)}");

      var document = parser.parse(htmlData);
      try {
        // var selectCampus = document.querySelector("select#search_campus");
        var optionCampus = document.querySelectorAll("select#search_campus > option");
        for (var i=0; i<optionCampus.length; i++) {
          final id = i;
          final campus = optionCampus[i].text.trim();
          var campus_obj = new CampusElement(id: id, campus: campus);
          campuses.add(campus_obj);
          
        }

        var selectFaculty = document.querySelector("select#search_faculty");
        var optionFaculty = selectFaculty?.querySelectorAll("option");
        for (var i=0; i<optionFaculty!.length; i++) {
          final id = i;
          final faculty = optionFaculty[i].text.trim();
          // Faculty(id: id, faculty: faculty);
          var faculty_obj = new FacultyElement(id: id, faculty: faculty);
          faculties.add(faculty_obj);
          
        }

          // data = {
          //   "statusCode": response.statusCode,
          //   "campuses": campuses,
          //   "faculties": faculties
          // };

        data = Campus(
          statusCode: response.statusCode,
          campuses: campuses,
          faculties: faculties
        );

        final campusList = campusToJson(data);
        print(campusList);
      }
      catch (e) {
        throw e;
      }
    }
    else {
      print("Error occured");
      final campusList = null;
      return campusList;

    }
   
  } catch (e) {
    print("Exception: $e");
  }





  // var document = parser.parse(htmlData);
  // var data = {};
  // var campuses = [];
  // var faculties = [];

  // try {
  //   var selectCampus = document.querySelector("select#search_campus");
  //   var optionCampus = selectCampus!.querySelectorAll("option");
  //   for (var i=0; i<optionCampus.length; i++) {
  //     final id = i;
  //     final campus = optionCampus[i].text.trim();
  //     var campus_obj = {"id": id, "campus": campus};
  //     campuses.add(campus_obj);
  //     // print(campus_obj);
      
  //   }

  //   var selectFaculty = document.querySelector("select#search_faculty");
  //   var optionFaculty = selectFaculty!.querySelectorAll("option");
  //   for (var i=0; i<optionFaculty.length; i++) {
  //     final id = i;
  //     final faculty = optionCampus[i].text.trim();
  //     var faculty_obj = {"id": id, "faculty": faculty};
  //     faculties.add(faculty_obj);
  //     // print(faculty_obj);
      
  //   }

  //   data = {
  //     "campuses": campuses,
  //     "faculties": faculties
  //   };

  //   print(json.encode(data));

  //  }
  //  catch (e) {
  //    throw e;
  //  }
}