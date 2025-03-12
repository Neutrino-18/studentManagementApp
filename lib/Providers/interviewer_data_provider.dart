import 'dart:async';

import 'package:app_crt/Modals/interviewer.dart';
import 'package:app_crt/Providers/login_info.dart';
import 'package:app_crt/Repos/interviewer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final interviewerDataProvider =
    AsyncNotifierProvider<InterviewerDataNotifier, Interviewer>(() {
  return InterviewerDataNotifier();
});

class InterviewerDataNotifier extends AsyncNotifier<Interviewer> {
  @override
  FutureOr<Interviewer> build() async {
    debugPrint("Called build of interviewer provider");
    final userId = ref.watch(loginProvider).userId;
    debugPrint(userId);
    return interviewerHelper.fetchInterviewer(userId);
  }
}

final interviewerHelper = InterviewerHelper();
