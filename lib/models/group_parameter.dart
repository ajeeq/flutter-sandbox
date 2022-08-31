import 'package:equatable/equatable.dart';

class GroupParameter extends Equatable  {
  GroupParameter({
    required this.campusName,
    required this.facultyName,
    required this.courseName
  });

  final String campusName;
  final String facultyName;
  final String courseName;

  @override
  List<Object> get props => [campusName, facultyName, courseName];
}