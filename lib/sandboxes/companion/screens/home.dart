// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

// Screens
import 'package:flutter_sandbox/sandboxes/companion/screens/home.dart';
import 'package:flutter_sandbox/sandboxes/companion/screens/schedule/schedule_list.dart';

// Services
import 'package:flutter_sandbox/api/services.dart';
import 'package:flutter_sandbox/api/servicestwo.dart';

// Utils
import 'package:flutter_sandbox/utils/utils_main.dart';
import 'package:flutter_sandbox/utils/hive_selected_course.dart';

// Models
import 'package:flutter_sandbox/models/detail.dart';
import 'package:flutter_sandbox/models/selected.dart';

// Providers
import 'package:flutter_sandbox/providers/selected_providers.dart';
import 'package:flutter_sandbox/providers/detail_providers.dart';

// Hive
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:flutter_sandbox/sandboxes/companion/widgets/top_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;
  final List<Widget> _screens = [
    Home(),
    ScheduleList()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 217, 217, 217),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Column(
            children: [
              const TopBar(
                title: "Companion",
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: (index) {
          // switch to the selected screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => _screens[index]),
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Scheduler',
          )
        ]
      ),
    );
  }
}