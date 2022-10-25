import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// void main() async {
//   BaseOptions options = BaseOptions(
//     baseUrl: "https://icress.uitm.edu.my",
//     headers: {
//         "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36",
//         'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
//         'content-type': 'application/x-www-form-urlencoded',
//         "Sec-Ch-Ua": "\"Chromium\";v=\"106\", \"Google Chrome\";v=\"106\", \"Not;A=Brand\";v=\"99\"", 
//         "Sec-Ch-Ua-Mobile": "?0", 
//         "Sec-Ch-Ua-Platform": "\"Windows\""
//     },
//     connectTimeout: 3000,
//     receiveTimeout: 3000,
//   );
//   Dio dio = Dio(options);
//   try {
//     Response resp = await dio.get("/timetable/search.asp");
//     print("Response:");
//     print("Status: ${resp.statusCode}");
//     print("Header: ${resp.headers}");
//     // print("Data: ${resp.data}");
//   } catch (e) {
//     print("Exception: $e");
//   }
// }

// Response:
// Status: 200
// Header: cache-control: private
// set-cookie: ASPSESSIONIDAAQADCBD=FOLCDJDCEAIGMMAMHHLHFPDK; path=/
// date: Tue, 11 Oct 2022 07:08:01 GMT
// content-length: 58973
// content-type: text/html
// x-frame-options: SAMEORIGIN
// x-xss-protection: 1
// x-content-type-options: nosniff
// server: Microsoft-IIS/10.0

void main(List<String> args) async {
   final response = await http.get(
    Uri.parse('https://icress.uitm.edu.my/timetable/search.asp'),
    headers: {
      "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36",
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
      'content-type': 'application/x-www-form-urlencoded',
    });
    //Status Code 200 means response has been received successfully
    try {
      print("Response:");
      print("Status: ${response.statusCode}");
      print("Header: ${json.encode(response.headers)}");
      // print("Data: ${resp.data}");
  } catch (e) {
    print("Exception: $e");
  }
}

// {
//   "cache-control": "private",
//   "set-cookie": "ASPSESSIONIDAAQADCBD=NPNCDJDCPMJACLFJEEPKJPPH; path=/",
//   "date": "Tue, 11 Oct 2022 07:24:11 GMT",
//   "content-length": "58973",
//   "content-type": "text/html",
//   "x-frame-options": "SAMEORIGIN",
//   "x-xss-protection": "1",
//   "x-content-type-options": "nosniff",
//   "server": "Microsoft-IIS/10.0"
// }