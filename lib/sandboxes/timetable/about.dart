// Import directives
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Services
import 'package:flutter_sandbox/services.dart';

// Provider
import 'package:flutter_sandbox/providers/detail_providers.dart';

class About extends ConsumerWidget{
  About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Center(
            child: Text(
              "About Screen is here",
            ),
          )
        ],
      )
    );
  }
  
}