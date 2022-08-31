// Import directives
import 'package:flutter_riverpod/flutter_riverpod.dart';

// API Services
import 'package:sandbox_riverpod/services.dart';

// Models
import 'package:sandbox_riverpod/models/campus.dart';
import 'package:sandbox_riverpod/models/campus_parameter.dart';
import 'package:sandbox_riverpod/models/course.dart';
import 'package:sandbox_riverpod/models/detail.dart';
import 'package:sandbox_riverpod/models/group.dart';
import 'package:sandbox_riverpod/models/group_parameter.dart';

// TODO: Use FutureProvider instead of calling Service class methods
final campusListFutureProvider = FutureProvider.autoDispose<List<CampusElement>>((ref) {
  return Services.getCampuses();
});

final courseListFutureProvider = FutureProvider.autoDispose.family<List<CourseElement>, CampusParameter>((ref, c) {
  return Services.getCourses(c.campusName, c.facultyName);
});

final groupListFutureProvider = FutureProvider.autoDispose.family<List<GroupElement>, GroupParameter>((ref, gp) {
  return Services.getGroup(gp.campusName, gp.facultyName, gp.courseName);
});

final detailListFutureProvider = FutureProvider.autoDispose.family<List<DetailElement>, Map>((ref, rj) {
  return Services.getDetails(rj);
});