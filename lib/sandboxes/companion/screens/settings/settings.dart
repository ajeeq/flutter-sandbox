// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Services
import 'package:flutter_sandbox/api/services.dart';

// Provider
import 'package:flutter_sandbox/providers/detail_providers.dart';

class Settings extends ConsumerWidget{
  Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12, bottom: 12),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/ic_launcher.png',
                    height: 144,
                  ),
                  Text("UiTM Scheduler V0.5.2"),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    child: ListTile(
                      leading: Icon(Icons.settings, size: 32),
                      title: Text('Preference'),
                      subtitle: Text('Your campus selection'),
                      onTap: () {
                        // handle item tap
                      },
                    ),
                  ),
                  Container(
                    // height: 72,
                    child: ListTile(
                      leading: Icon(Icons.help, size: 32),
                      title: Text('Help'),
                      subtitle: Text('Frequently asked question'),
                      onTap: () {
                        // handle item tap
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.info, size: 32),
                    title: Text('About'),
                    subtitle: Text("App changelog, privacy policy, terms and condition"),
                    onTap: () {
                      // handle item tap
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
  
}