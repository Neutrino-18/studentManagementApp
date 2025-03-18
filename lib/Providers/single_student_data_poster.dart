import 'dart:async';

import 'package:app_crt/Repos/student_score_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studenDataPostProvider = AsyncNotifierProvider<SingleStudentDataPoster,String>(() => ,);



class SingleStudentDataPoster extends AsyncNotifier<String>{
final String id;
final String interviewerName ;
final String remark ;
final String round;
 final int score; 
 SingleStudentDataPoster({required this.id, required this.interviewerName, required this.remark, required this.round, required this.score});

@override
  FutureOr<String> build() {
    
    return scorePoster();
    
  }


  Future<String> scorePoster(){

final scorePost = StudentScoreHelper(id: id, interviewerName: interviewerName, remark: remark, round: round, score: score);





  }


}

