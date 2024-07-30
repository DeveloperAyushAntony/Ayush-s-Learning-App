import 'package:flutter/foundation.dart';

class CourseProvider with ChangeNotifier {
  double _courseId = 0;
  String _courseName = '';

  double get courseId => _courseId;
  String get courseName => _courseName;

  void setCourseId(double id) {
    _courseId = id;
    if (id == 11 || id == 21 || id == 31 || id == 41 || id == 51) {
      _courseName = "Creative Writing";
    } else if (id == 12 || id == 22 || id == 32 || id == 42 || id == 52) {
      _courseName = "Public Speaking";
    } else if (id == 23 || id == 33 || id == 43 || id == 53) {
      _courseName = "Personality Development";
    } else if (id == 44 || id == 54) {
      _courseName = "Interview Preparation";
    } else {
      _courseName = "Unknown Course";
    }
    notifyListeners();
  }
}
