import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: false,
        brightness: Brightness.light,
      ),
      home: const MyHomePage(title: 'Flutter Example App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({super.key, required this.title});

  const MyHomePage({
    Key? key,
    required this.title
  })  : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    final List periods = ['8:00 - 9:00', '9:00 - 10:00', '10:00 - 11:00', '11:00 - 12:00', '12:00 - 13:00'];
    List<Schedule> schedule = [
        Schedule(course: 'ENG101', name: 'English 101',  room: 'A101'),
        Schedule(course: 'MTH101', name: 'Math 101', room: 'B201')
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Table(
        defaultColumnWidth: IntrinsicColumnWidth(),
        border: TableBorder.all(color: Colors.grey),
        children: [
          TableRow(
            children: [
              Container(),
              for (int i = 0; i < days.length; i++)
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(days[i]),
                ),
            ],
          ),
          for (int j = 0; j < periods.length; j++)
            TableRow(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(periods[j]),
                ),
                for (int i = 0; i < days.length; i++)
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("schedule[j][i].name"),
                          SizedBox(height: 4.0),
                          Icon(Icons.location_on, size: 16.0),
                          SizedBox(height: 4.0),
                          Text("schedule[j][i].room"),
                        ],
                      ),
                    ),
                    onTap: () {
                      // navigate to the details screen for the selected subject/course
                    },
                  ),
              ],
            ),
        ],
      ),

      
    
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Screen'));
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Search Screen'));
  }
}

class Schedule {
  final String name;
  final String course;
  final String room;

  Schedule({
    required this.name,
    required this.course,
    required this.room,
  });
}

