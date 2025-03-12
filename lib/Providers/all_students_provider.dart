import 'dart:async';
import 'package:app_crt/Modals/student_model.dart';
import 'package:app_crt/Providers/interviewer_data_provider.dart';
import 'package:app_crt/Repos/all_students_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllStudentsNotifier extends AsyncNotifier<List<StudentModel>> {
  @override
  FutureOr<List<StudentModel>> build() async {
    debugPrint("Called Build inside AllStudentProvider");
    final info = ref.watch(interviewerDataProvider).value;
    final allStudents = await allStudentsHelper.fetchAllStudents();

    if (info!.subject == 'Tech') {
      state = AsyncValue.data(allStudents
          .where((item) => item.techPerform.first.interviewer == info.id)
          .toList());
    }
    return [];
  }
}

final allStudentProvider =
    AsyncNotifierProvider<AllStudentsNotifier, List<StudentModel>>(
        () => AllStudentsNotifier());

final allStudentsHelper = AllStudentsHelper();
// item.techPerform.first.interviewer == info.id
