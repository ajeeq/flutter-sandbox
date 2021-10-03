import 'package:shared_preferences/shared_preferences.dart';
import 'package:sandbox_riverpod/models/selection_parameter.dart';

class SelectionPreferences {
  // List<SelectionParameter> _selectionListStatePref = [];
  // List<SelectionParameter> get selectionListStatePref => _selectionListStatePref;

  static Future<List<SelectionParameter>> getSelectionStatePrefs(String key) async {
    var prefs = await SharedPreferences.getInstance();
    final rawJson = (prefs.getString(key)) ?? '';

    if (rawJson != '') {
      final List<SelectionParameter> _selectionListStatePref = selectionParameterFromJson(rawJson);
      return _selectionListStatePref;
    }
    else {
      final List<SelectionParameter> _selectionListStatePref = [];
      return _selectionListStatePref;
    }
  }
}