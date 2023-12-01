// Import directives
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

// List of Models
import 'package:flutter_sandbox/models/cam_fac.dart';


void main(List<String> args) async {
  var campusLink = Uri.parse('https://simsweb4.uitm.edu.my/estudent/class_timetable/cfc/select.cfc?method=find_cam_icress_student&key=All&page=1&page_limit=30');
  var facultyLink = Uri.parse('https://simsweb4.uitm.edu.my/estudent/class_timetable/cfc/select.cfc?method=find_fac_icress_student&key=All&page=1&page_limit=30');
  var headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36",
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
    'content-type': 'application/x-www-form-urlencoded',
  };

  // HTTP EXAMPLE WITH HEADERS:
  // final response = await http.get(campusLink, headers: headers);
  CampusFaculty data;
  List<CampusFaculty> campuses = [];
  List<CampusFaculty> faculties = [];
  final body = """{"total":41,"results":[{"text":"SELANGOR CAMPUS - ( Please Select a Faculty )","id":"B"},{"text":"SELANGOR CAMPUS - LANGUAGE COURSES","id":"APB"},{"text":"SELANGOR CAMPUS - CITU COURSES","id":"CITU"},{"text":"SELANGOR CAMPUS - CO-CURRICULUM COURSES","id":"HEP"},{"text":"========================================","id":"X"},{"text":"A - UITM KAMPUS SERI ISKANDAR","id":"A"},{"text":"A4 - UITM KAMPUS TAPAH","id":"A4"},{"text":"B10 - UITM KAMPUS DENGKIL","id":"B10"},{"text":"C - UITM KAMPUS JENGKA","id":"C"},{"text":"C3 - UITM KAMPUS RAUB","id":"C3"},{"text":"D - UITM KAMPUS MACHANG","id":"D"},{"text":"D2 - UITM KAMPUS KOTA BHARU","id":"D2"},{"text":"FAB - KOLEJ WIDAD","id":"FAB"},{"text":"FC - KOLEJ YAYASAN PAHANG","id":"FC"},{"text":"FEW - EAST WEST INTERNATIONAL COLLEGE","id":"FEW"},{"text":"FFE - KOLEJ FELCRA","id":"FFE"},{"text":"FJ - KOLEJ ISLAM YAYASAN PELAJARAN JOHOR","id":"FJ"},{"text":"FL - INS. PROFESIONAL BAITULMAL KUALA LUMPUR","id":"FL"},{"text":"FM - KOLEJ ANTARABANGSA UNIFIELD","id":"FM"},{"text":"FMA - MELAKA INTER. COLLEGE OF SCIENCE & TECH.","id":"FMA"},{"text":"FMM - MALAYSIAN CONSORTIUM FOR EDU. MAURITIUS","id":"FMM"},{"text":"FN - KOLEJ UNITI","id":"FN"},{"text":"FQ - KOLEJ SATT","id":"FQ"},{"text":"FQI - QAIWAN INTERNATIONAL UNIVERSITY","id":"FQI"},{"text":"J - UITM KAMPUS SEGAMAT","id":"J"},{"text":"J4 - UITM KAMPUS PASIR GUDANG","id":"J4"},{"text":"K - UITM KAMPUS SUNGAI PETANI","id":"K"},{"text":"M - UITM KAMPUS ALOR GAJAH","id":"M"},{"text":"M1 - UITM KAMPUS BANDARAYA MELAKA","id":"M1"},{"text":"M3 - UITM KAMPUS JASIN","id":"M3"},{"text":"N3 - UITM KAMPUS KUALA PILAH","id":"N3"},{"text":"N4 - UITM KAMPUS SEREMBAN 3","id":"N4"},{"text":"N5 - UITM KAMPUS REMBAU","id":"N5"},{"text":"P - UITM KAMPUS BUKIT MERTAJAM","id":"P"},{"text":"P2 - UITM KAMPUS BERTAM","id":"P2"},{"text":"P4 - UITM KAMPUS PERMATANG PAUH","id":"P4"},{"text":"Q - UITM KAMPUS SAMARAHAN","id":"Q"},{"text":"Q3 - UITM KAMPUS MUKAH","id":"Q3"},{"text":"Q5 - UITM KAMPUS SAMARAHAN 2","id":"Q5"},{"text":"Q6 - UITM KAMPUS MUKAH","id":"Q6"},{"text":"R - UITM KAMPUS ARAU","id":"R"},{"text":"S - UITM KAMPUS KOTA KINABALU","id":"S"},{"text":"S2 - UITM KAMPUS TAWAU","id":"S2"},{"text":"T - UITM KAMPUS DUNGUN","id":"T"},{"text":"T4 - UITM KAMPUS BUKIT BESI","id":"T4"},{"text":"T5 - UITM KAMPUS KUALA TERENGGANU (CENDERING)","id":"T5"}]}""";

  try {
    if (true) {
      // print("Response:");
      // print("Status: ${response.statusCode}");
      // print("Header: ${json.encode(response.headers)}");
      // print("Data: ${(response.body)}");
      // final datas = response.body;
      final res = campusFacultyFromJson(body);
      print(res.results);
    }
    else {
      // print("Error occured");
      // final campusList = null;
      // return campusList;

    }
    
  } catch (e) {
    print("Exception: $e");
  }
}