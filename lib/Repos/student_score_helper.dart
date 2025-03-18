import 'package:app_crt/Common/Constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class StudentScoreHelper {
  final String interviewerName;
  final String round;
  final String remark;
  final String score;
  final String id;
  StudentScoreHelper(
      {required this.id,
      required this.interviewerName,
      required this.remark,
      required this.round,
      required this.score});

  String dateformat = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<void> postTechScore() async {
    final url = "${NetworkKeys.studentTechScorePost}$id";

    final response = await http.put(
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
    print("The status code is ${response.statusCode}");
    print("The respone from tech poster of score is ${response.body}");
    // return jsonDecode(response.body);
  }

  Future<void> postGDScore() async {
    final url = "${NetworkKeys.studentGDScorePost}$id";

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

    print("The respone from gd poster of score is ${response.body}");
    // return jsonDecode(response.body);
  }

  Future<void> postHRScore() async {
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

    print("The respone from hr poster of score is ${response.body}");
    //return jsonDecode(response.body);
  }
}
