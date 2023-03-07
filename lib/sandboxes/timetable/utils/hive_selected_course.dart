import 'package:flutter_sandbox/models/selected.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveSelectedCourse {
  static const boxName = "selectedCourse";

  // Get reference to an already opened box
  static Box<Selected> box = Hive.box<Selected>(boxName);

  // Add new course
  Future<void> addSelected({required Selected selectedModel}) async {
    await box.add(selectedModel);
  }

  // show course list
  Future<void> getSelected({required String id})async{
    await box.get(id);
  }

  // Get all courses
  List<Selected> getAllSelected() {
    List<Selected> selectedList = [];

    for (int i = 0; i < box.length; i++) {
      selectedList.add(box.getAt(i) as Selected);
    }

    return selectedList;
  }

  // update course data
  Future<void> updateSelected({required int index, required Selected selectedModel}) async {
    await box.putAt(index, selectedModel);
  }

  // delete course
  Future<void> deleteSelected({required int index}) async {
    await box.deleteAt(index);
  }

}
