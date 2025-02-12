import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginHelper {
  static const loginURL = "http://192.168.141.15:8000/schedule/login/auth";

  Future<String> login(String email, String rollno) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.141.15:8000/schedule/login/auth"),
        headers: {"content-type": "application/json"},
        body: jsonEncode(
          {"email": email, "password": rollno},
        ),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final String userId = data["user_id"];
        return userId;
      } else {
        return "";
      }
    } catch (e) {
      print('Error with login is $e');
      return "";
    }
  }
}
