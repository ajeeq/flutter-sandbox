import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox_riverpod/models/campus.dart';
import 'package:sandbox_riverpod/services.dart';

final campusListProvider = FutureProvider<List<CampusElement>>((ref) {
  return Services.getCampuses();
});