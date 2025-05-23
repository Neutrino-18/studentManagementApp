import 'dart:async';

import 'package:app_crt/Modals/student_model.dart';
import 'package:app_crt/Providers/login_info.dart';
import 'package:app_crt/Repos/student_data_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentNotifier extends AsyncNotifier<StudentModel> {
  @override
  FutureOr<StudentModel> build() async {
    return fetchStudents();
  }

  Future<StudentModel> fetchStudents() async {
    state = const AsyncLoading();

    try {
      final studentId = ref.read(loginProvider).userId;
      final student = await StudentHelper().fetchAnnouncements(studentId);

      state = AsyncData(student);
      print('state is $state');
      return student;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      throw e.toString();
    }
  }
}

final studentDataProvider =
    AsyncNotifierProvider<StudentNotifier, StudentModel?>(
  () => StudentNotifier(),
);
