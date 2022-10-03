import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_sandbox/models/selected.dart';

class SelectionPreferences {
  // List<Selected> _selectionListStatePref = [];
  // List<Selected> get selectionListStatePref => _selectionListStatePref;

  static Future<List<Selected>> getSelectionStatePrefs(String key) async {
    var prefs = await SharedPreferences.getInstance();
    final rawJson = (prefs.getString(key)) ?? '';

    if (rawJson != '') {
      final List<Selected> _selectionListStatePref = selectedFromJson(rawJson);
      return _selectionListStatePref;
    }
    else {
      final List<Selected> _selectionListStatePref = [];
      return _selectionListStatePref;
    }
  }
}