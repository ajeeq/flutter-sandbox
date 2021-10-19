import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const darkModeBox = 'darkModeTutorial';


class HiveDarkMode extends StatefulWidget {
  @override
  State<HiveDarkMode> createState() => _HiveDarkModeState();
}

class _HiveDarkModeState extends State<HiveDarkMode> {
  late final Box box;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box(darkModeBox);
  }

  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(darkModeBox).listenable(),
      builder: (context, Box box, widget) {
        var darkMode = box.get('darkMode', defaultValue: false);

        return MaterialApp(
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark(),
          home: Scaffold(
            body: Center(
              child: Switch(
                value: darkMode,
                onChanged: (val) {
                  box.put('darkMode', !darkMode);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}