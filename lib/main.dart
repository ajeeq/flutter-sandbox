// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// .env file for loading environment variables
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Sandbox - companion
// import 'package:flutter_sandbox/sandboxes/companion/screens/home.dart';
// import 'package:flutter_sandbox/sandboxes/companion/screens/schedule/campus_selection.dart';
// import 'package:flutter_sandbox/sandboxes/companion/screens/schedule/faculty_selection.dart';
// import 'package:flutter_sandbox/sandboxes/companion/screens/schedule/course_selection.dart';
// import 'package:flutter_sandbox/sandboxes/companion/screens/schedule/group_selection.dart';
// import 'package:flutter_sandbox/sandboxes/companion/screens/schedule/schedule_list.dart';
// import 'package:flutter_sandbox/sandboxes/companion/screens/schedule/schedule_result.dart';
import 'package:flutter_sandbox/sandboxes/companion/screens/settings/settings.dart';

// Sandbox - timetablev2
import 'package:flutter_sandbox/sandboxes/timetablev2/home.dart';
import 'package:flutter_sandbox/sandboxes/timetablev2/result.dart';
import 'package:flutter_sandbox/sandboxes/timetablev2/selection.dart';
import 'package:flutter_sandbox/sandboxes/timetablev2/campus_selection.dart';
import 'package:flutter_sandbox/sandboxes/timetablev2/faculty_selection.dart';
import 'package:flutter_sandbox/sandboxes/timetablev2/course_selection.dart';
import 'package:flutter_sandbox/sandboxes/timetablev2/group_selection.dart';

// Models
import 'package:flutter_sandbox/models/selected.dart';


/**
 * sandbox - userlist
 */
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(color: Color(0xFF064479)),
//         primaryColor: Color(0xFF064479),
//         backgroundColor: Color(0xFFb7eeff),
//       ),
//       home: Home(),
//     );
//   }
// }

// ignore: slash_for_doc_comments
/**
 * sandbox - weather
 */
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ProviderScope(
//       // Overriding for testing
//       overrides: [
//         todoRepositoryProvider.overrideWithValue(FakeTodoRepository())
//       ],
//       child: MaterialApp(
//         title: 'Reading Providers',
//         home: GestureDetector(
//           onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
//           child: const TodoScreen(),
//         ),
//       ),
//     );
//   }
// }

Future main() async {
  // Loading env file for accessing secured environment variables
  await dotenv.load(fileName: "local.env");

  await Hive.initFlutter();
  Hive.registerAdapter<Selected>(SelectedAdapter());

  await Hive.openBox("darkModeTutorial"); //hive_darkmode
  await Hive.openBox<String>("favorite_books"); //hive_books
  await Hive.openBox<Selected>("selectedCourse");
  
  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // main -> sandbox project entry (now = timetablev2)
        '/': (context) => Home(),
        '/selection': (context) => Selection(),
        '/result': (context) => Result(),
        '/campus_selection': (context) => CampusSelection(),
        '/faculty_selection': (context) => FacultySelection(),
        '/course_selection': (context) => CourseSelection(),
        '/group_selection': (context) => GroupSelection(),
        // '/schedule_list': (context) => ScheduleList(),
        // '/schedule_result': (context) => ScheduleResult(),
        '/about': (context) => Settings()
      },
    );
  }
}
