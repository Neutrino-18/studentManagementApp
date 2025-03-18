import 'package:app_crt/Common/Constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class StudentScoreHelper {
  final String interviewerName;
  final String round;
  final String remark;
  final int score;
  final String id;
  StudentScoreHelper(
      {required this.id,
      required this.interviewerName,
      required this.remark,
      required this.round,
      required this.score});

  final dateformat = DateFormat.yMd().format(DateTime.now());

  Future<String> postTechScore() async {
    final url = "${NetworkKeys.studentHRSCorePost}$id";

    final response = await http.post(
      Uri.parse(url),
      headers: {"content-type": "application/json"},
      body: jsonEncode(
        {
          "interviewer_name": interviewerName,
          "date": dateformat,
          "round": round,
          "remark": remark,
          "score": score
        },
      ),
    );

    print("The respone from poster of score is ${response.body}");
    return jsonDecode(response.body);
  }
}
