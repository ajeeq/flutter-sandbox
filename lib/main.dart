// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// .env file for loading environment variables
import 'package:flutter_dotenv/flutter_dotenv.dart';

// SharedPreferences
import 'package:sandbox_riverpod/sandboxes/schedulerv0.2/utils/result_prefs.dart';
import 'package:sandbox_riverpod/sandboxes/schedulerv0.2/utils/selection_prefs.dart';

// Sandbox - basic
// import 'package:sandbox_riverpod/sandboxes/basic/BasicHome.dart';

// Sandbox - userlist
// import 'package:sandbox_riverpod/sandboxes/userlist/screens/home.dart';

// Sandbox - campus
// import 'package:sandbox_riverpod/sandboxes/campus/home_campus.dart';

// Sandbox - schedulerv0.2
import 'package:sandbox_riverpod/sandboxes/schedulerv0.2/home.dart';
import 'package:sandbox_riverpod/sandboxes/schedulerv0.2/selection.dart';
import 'package:sandbox_riverpod/sandboxes/schedulerv0.2/result.dart';

// Sandbox - hive_darkmode
import 'package:sandbox_riverpod/sandboxes/hive_darkmode/hive_darkmode.dart';

// Sandbox - hive_counter
import 'package:sandbox_riverpod/sandboxes/hive_counter/hive_counter.dart';

// Sandbox - hive_books
import 'package:sandbox_riverpod/sandboxes/hive_books/hive_books.dart';


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
  await Hive.openBox("darkModeTutorial"); //hive_darkmode
  await Hive.openBox<String>("favorite_books"); //hive_books
  
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
        // main -> sandbox project entry (now = hive_books)
        '/': (context) => Home(),

        // schedulerv0.1
        '/selection': (context) => Selection(),

        // schedulerv0.1
        '/result': (context) => Result(),
      },
    );
  }
}
