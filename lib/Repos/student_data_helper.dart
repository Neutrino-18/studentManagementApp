import 'package:app_crt/Modals/announcements.dart';
import 'package:app_crt/Modals/student_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentHelper {
  // static const String _baseURL = "http://127.0.0.1:8000";
  // static const String _announcement =
  //     "$_baseURL/schedule/get/flutr/announcements/";

  Future<StudentModel?> fetchAnnouncements(String? studentId) async {
    try {
      final url = Uri.parse(
          'http://192.168.141.15:8000/schedule/get/flutr/student/"$studentId"');

      final response = await http.get(url);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return StudentModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load User Data!!");
      }
    } catch (e) {
      print('Request Failed $e');
      return null;
    }
  }
}
