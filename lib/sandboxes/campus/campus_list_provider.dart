import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sandbox/models/campus.dart';
import 'package:flutter_sandbox/services.dart';

final campusListProvider = FutureProvider<List<CampusElement>>((ref) {
  return Services.getCampuses();
});