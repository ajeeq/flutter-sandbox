// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// .env file for loading environment variables
import 'package:flutter_dotenv/flutter_dotenv.dart';

// SharedPreferences
// import 'package:flutter_sandbox/sandboxes/schedulerv0.2/utils/result_prefs.dart';
// import 'package:flutter_sandbox/sandboxes/schedulerv0.2/utils/selection_prefs.dart';

// Sandbox - basic
// import 'package:flutter_sandbox/sandboxes/basic/BasicHome.dart';

// Sandbox - userlist
// import 'package:flutter_sandbox/sandboxes/userlist/screens/home.dart';

// Sandbox - campus
// import 'package:flutter_sandbox/sandboxes/campus/home_campus.dart';

// Sandbox - schedulerv0.1
// import 'package:flutter_sandbox/sandboxes/schedulerv0.1/home.dart';
// import 'package:flutter_sandbox/sandboxes/schedulerv0.1/selection.dart';
// import 'package:flutter_sandbox/sandboxes/schedulerv0.1/result.dart';
// import 'package:flutter_sandbox/sandboxes/schedulerv0.2/settings.dart';
// import 'package:flutter_sandbox/sandboxes/schedulerv0.2/translate.dart';
// import 'package:flutter_sandbox/sandboxes/schedulerv0.2/dictionary.dart';

// Sandbox - timetable
import 'package:flutter_sandbox/sandboxes/timetable/home.dart';
import 'package:flutter_sandbox/sandboxes/timetable/selection.dart';
import 'package:flutter_sandbox/sandboxes/timetable/result.dart';
import 'package:flutter_sandbox/sandboxes/timetable/about.dart';

// Sandbox - hive_darkmode
import 'package:flutter_sandbox/sandboxes/hive_darkmode/hive_darkmode.dart';

// Sandbox - hive_counter
import 'package:flutter_sandbox/sandboxes/hive_counter/hive_counter.dart';

// Sandbox - hive_books
import 'package:flutter_sandbox/sandboxes/hive_books/hive_books.dart';

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
        // main -> sandbox project entry (now = timetable)
        '/': (context) => Home(),
        '/selection': (context) => Selection(),
        '/result': (context) => Result(),
        '/about': (context) => About()

        // schedulerv0.2
        // '/settings': (context) => Settings(),
        // '/dictionary': (context) => Dictionary(),
        // '/translate': (context) => Translate(),
      },
    );
  }
}
