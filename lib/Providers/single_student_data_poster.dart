import 'dart:async';

import 'package:app_crt/Common/Constants/names.dart';
import 'package:app_crt/Providers/interviewer_data_provider.dart';
import 'package:app_crt/Repos/student_score_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studenDataPostProvider =
    StateNotifierProvider<SingleStudentDataPoster, String>(
        (ref) => SingleStudentDataPoster(ref));

class SingleStudentDataPoster extends StateNotifier<String> {
  SingleStudentDataPoster(this.ref) : super("");
  final Ref ref;
  void scorePoster(String id, String interviewerName, String remark,
      String round, String score) async {
    print("Reached score poster");
    final interviewerData = ref.read(interviewerDataProvider).value;
    final sub = interviewerData!.subject;
    final instance = StudentScoreHelper(
      id: id,
      interviewerName: interviewerName,
      remark: remark,
      round: round,
      score: score,
    );
    try {
      if (sub == SubjectCategory.tech) {
        print("awaiting techposter");
        await instance.postTechScore();
      } else if (sub == SubjectCategory.gdExtempore) {
        print("awaiting gdposter");
        await instance.postGDScore();
      } else if (sub == SubjectCategory.tech) {
        print("awaiting hrposter");
        await instance.postHRScore();
      } else {
        throw "Errorr Niggggaaa";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
// final String id;
  // final String interviewerName;
  // final String remark;
  // final String round;
  // final int score;
  // SingleStudentDataPoster(
  //     {required this.id,
  //     required this.interviewerName,
  //     required this.remark,
  //     required this.round,
  //     required this.score});