import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sandbox/models/campus_faculty.dart';
import 'package:flutter_sandbox/api/services.dart';

final campusListProvider = FutureProvider<List<CampusElement>>((ref) {
  return Services.getCampuses();
});