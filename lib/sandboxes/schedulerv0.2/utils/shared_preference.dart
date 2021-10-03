import 'package:shared_preferences/shared_preferences.dart';
 
class MySharedPreferences {
  MySharedPreferences._privateConstructor();
 
  static final MySharedPreferences instance =
      MySharedPreferences._privateConstructor();
 
  setStringValue(String key, String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }
 
  Future<String> getStringValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(key) ?? "";
  }
 
  setIntegerValue(String key, int value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setInt(key, value);
  }
 
  Future<int> getIntegerValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getInt(key) ?? 0;
  }
 
  setBooleanValue(String key, bool value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }
 
  Future<bool> getBooleanValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(key) ?? false;
  }
 
  Future<bool> containsKey(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.containsKey(key);
  }
 
  removeValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.remove(key);
  }
 
  removeAll() async{
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.clear();
  }
 
}