// Import directives
import 'package:flutter_riverpod/flutter_riverpod.dart';

// API Services
import 'package:sandbox_riverpod/services.dart';

// Models
import 'package:sandbox_riverpod/models/campus.dart';
import 'package:sandbox_riverpod/models/course.dart';
import 'package:sandbox_riverpod/models/detail.dart';
import 'package:sandbox_riverpod/models/group.dart';
import 'package:sandbox_riverpod/models/group_parameter.dart';

// TODO: Use FutureProvider instead of calling Service class methods
final campusListFutureProvider = FutureProvider.autoDispose<List<CampusElement>>((ref) {
  return Services.getCampuses();
});

final courseListFutureProvider = FutureProvider.autoDispose.family<List<CourseElement>, String>((ref, campusName) {
  return Services.getCourses(campusName);
});

final groupListFutureProvider = FutureProvider.autoDispose.family<List<GroupArray>, GroupParameter>((ref, gp) {
  return Services.getGroup(gp.campusName, gp.courseName);
});

final detailListFutureProvider = FutureProvider.autoDispose.family<List<DetailElement>, Map>((ref, rj) {
  return Services.getDetails(rj);
});