import 'dart:async';

import 'package:app_crt/Modals/student_model.dart';
import 'package:app_crt/Repos/all_students_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllStudentsNotifier extends AsyncNotifier<List<StudentModel>> {
  @override
  FutureOr<List<StudentModel>> build() async {
    return await allStudentsHelper.fetchAllStudents();
  }
}

final allStudentProvider =
    AsyncNotifierProvider<AllStudentsNotifier, List<StudentModel>>(
        () => AllStudentsNotifier());

final allStudentsHelper = AllStudentsHelper();
