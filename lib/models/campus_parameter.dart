import 'package:equatable/equatable.dart';

class CampusParameter extends Equatable  {
  CampusParameter({
    required this.campusName,
    required this.courseName,
    required this.facultyName
  });

  final String campusName;
  final String courseName;
  final String facultyName;

  @override
  List<Object> get props => [campusName, courseName, facultyName];
}