import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginHelper {
  static const loginURL = "http://192.168.141.15:8000/schedule/login/auth";

  Future<String> postLoginCreds(String email, String rollno) async {
    final response = await http.post(
      Uri.parse(loginURL),
      headers: {"content-type": "application/json"},
      body: jsonEncode(
        {'username': email, 'password': rollno},
      ),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);

      return "";
    } else {
      return "";
    }
  }
}
