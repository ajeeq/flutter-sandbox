import 'package:shared_preferences/shared_preferences.dart';

class ResultPreferences{
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    // setState(() {
    //   _counter = prefs.setInt("counter", counter).then((bool success) {
    //     return counter;
    //   });
    // });
  }
}