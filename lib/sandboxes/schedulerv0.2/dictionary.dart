// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dictionary extends ConsumerWidget{
  const Dictionary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Language Translation Available:"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/translate");
              },
              child: const Text('Mandarin -> English/Malay'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('English/Malay -> Mandarin'),
            ),
          ],
        ),
      ),
          
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            tooltip: "FAB 1",
            heroTag: "one",
            backgroundColor: Colors.lightBlue,
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
  
          const SizedBox(height: 16),
  
          FloatingActionButton(
            tooltip: "FAB 2",
            heroTag: "two",
            backgroundColor: Colors.lightBlue,
            child: const Icon(Icons.find_in_page),
            onPressed: () async {},
          ),
          
        ],
      ),
    );
  }
}