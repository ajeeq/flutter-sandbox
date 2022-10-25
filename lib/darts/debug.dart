import 'package:http/http.dart' as http;
import 'dart:convert';

void main(List<String> args) async {
  const campusInput = "J-UITM KAMPUS SEGAMAT";
  const facultyInput = "";

  var campusCode = campusInput.split("-")[0].trim();
  var facultyCode = facultyInput.split("-")[0].trim();

  var url = Uri.parse('https://icress.uitm.edu.my/timetable/search.asp');
  var headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36",
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
    'content-type': 'application/x-www-form-urlencoded',
  };
  var body = {
      'yNTU2NDgiiLCJzY29wZSI6Ii9llbGFzdG': campusCode,
      'eyJ0eXAiOiiJKV1QiLCJhbGciOiJIUzI1NiJ9': facultyCode 
  };

  // HTTP EXAMPLE WITH HEADERS:
  final response = await http.get(url, headers: headers);
  // Status Code 200 means response has been received successfully
  try {
    if (response.statusCode == 200) {
      print("Response:");
      print("Status: ${response.statusCode}");
      print("Header: ${json.encode(response.headers)}");
      // print("Data: ${(response.body)}");
      print("location in header not found");
    }
    else if (response.statusCode == 302) {
      if (response.headers.containsKey("location")) {
        final redirectUrl = response.headers["location"];
        print(redirectUrl);

        final redirectedResponse = await http.post(Uri.parse(redirectUrl!), headers: headers, body: body);
        if (redirectedResponse.statusCode == 200) {
          print(redirectedResponse.body);
        }
        else
          print("Error occured after redirecting");
      }
      else
        print("location in header not found");
      
    }
   
  } catch (e) {
    print("Exception: $e");
  }

  // https://stackoverflow.com/questions/60947382/flutter-http-package-post-api-call-return-302-instead-of-200-post-is-success-in
  //  final response = await http.post(url,
  //       headers: headers, body: jsonBody, encoding: encoding);

  //   print('response.statusCode:' + response.statusCode.toString());

  //   if (response.statusCode == 302) {
  //     //print('response.headers:' + response.headers.toString());
  //     if (response.headers.containsKey("location")) {
  //       final getResponse = await http.get(response.headers["location"]);
  //       print('getResponse.statusCode:' + getResponse.statusCode.toString());
  //       return SubmitFeedApiResponse(success: getResponse.statusCode == 200);
  //     }
  //   } else {
  //     if (response.statusCode == 200) {
  //      // print('response.data:' + response.body);
  //       return SubmitFeedApiResponse.fromJson(json.decode(response.body));
  //     }
  //     return SubmitFeedApiResponse(success: false);
  //   }
  // }


  // from docs:
  // Future<Album> fetchAlbum() async {
  //   final response = await http.get(
  //     Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  //     // Send authorization headers to the backend.
  //     headers: {
  //       HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
  //     },
  //   );
  //   final responseJson = jsonDecode(response.body);
  //   return Album.fromJson(responseJson);
  // }


  // getUrlLocation:
  // Future<String?> getUrlLocation(String url) async {
  //   final client = HttpClient();
  //   var uri = Uri.parse(url);
  //   var request = await client.getUrl(uri);
  //   request.followRedirects = false;
  //   var response = await request.close();
  //   // print(response.headers.value(HttpHeaders.locationHeader));
  //   return response.headers.value(HttpHeaders.locationHeader);
  // }
  // getUrlLocation(url);


  // MULTIPLE REDIRECT:
  // final client = HttpClient();
  // var uri = Uri.parse("https://icress.uitm.edu.my/timetable/search.asp");
  // var request = await client.getUrl(uri);
  // request.followRedirects = false;
  // var response = await request.close();
  // while (response.isRedirect) {
  //   response.drain();
  //   final location = response.headers.value(HttpHeaders.locationHeader);
  //   if (location != null) {
  //     uri = uri.resolve(location);
  //     request = await client.getUrl(uri);
  //     // Set the body or headers as desired.
  //     request.followRedirects = false;
  //     response = await request.close();
  //     print(uri);
  //     print(response.headers);
  //   }
  // }
  // Do something with the final response.
}
