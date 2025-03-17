import 'package:app_crt/Common/Constants/names.dart';
import 'package:app_crt/Modals/interviewer.dart';
import 'package:app_crt/Modals/student_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final singleStudentDataProvider = StateNotifierProvider<
    SingleStudentDataNotifier, Map<String, List<PerformanceData>>>(
  (ref) => SingleStudentDataNotifier(),
);

class SingleStudentDataNotifier
    extends StateNotifier<Map<String, List<PerformanceData>>> {
  SingleStudentDataNotifier() : super({});

  /* Changes the Particular Student Screen Data according to the available Student and Interviewer data */
  void getStudentPerformance(
      StudentModel studentData, Interviewer interviewerData) {
    final subject = interviewerData.subject;

    if (subject == SubjectCategory.tech) {
      state = {...state, "Tech": studentData.techPerform};
    } else if (subject == SubjectCategory.gdExtempore) {
      state = {
        ...state,
        "GD/Extempore": studentData.gdPerform,
      };
    } else if (subject == SubjectCategory.hr) {
      state = {...state, "Hr": studentData.hrPerform};
    }
  }
}
