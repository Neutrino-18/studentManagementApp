import 'package:app_crt/Common/Constants/api.dart';
import 'package:app_crt/Modals/student_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentHelper {
  Future<StudentModel> fetchAnnouncements(String? studentId) async {
    try {
      final url = Uri.parse('${NetworkKeys.studentDataFetch}/"$studentId"');

      final response = await http.get(url);
      // print(response.statusCode);
      // print(response.body);
      if (response.statusCode == 200) {
        final data = StudentModel.fromJson(jsonDecode(response.body));
        // print('STUDENT DATA IS : $data');
        return data;
      } else {
        throw Exception("Failed to load User Data!!");
      }
    } catch (e) {
      print('Request Failed the error is : $e');
      throw e.toString();
    }
  }
}
