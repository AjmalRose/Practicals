import 'package:flutter/material.dart';
import 'package:provider_application1/Models/student_model.dart';

class StudentProvider extends ChangeNotifier {
  final List<StudentModel> _studentlist = [];
  bool _islog = false;

  List<StudentModel> get studentlist => _studentlist;
  bool get islog => _islog;

  Future<void> addStudent(StudentModel student) async {
    _islog = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    _studentlist.add(student);

    _islog = false;
    notifyListeners();
  }

  void deleteData(int index) {
    _studentlist.removeAt(index);
    notifyListeners();
  }
}

class StudentList extends ChangeNotifier {}
