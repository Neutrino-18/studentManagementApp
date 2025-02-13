import 'package:app_crt/Modals/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginHelper {
  static const loginURL = "http://192.168.141.15:8000/schedule/login/auth";

  Future<LoginState> login(String email, String rollno) async {
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
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        print(data);
        final filteredData = LoginState.fromJson(data);
        print(filteredData);
        return filteredData;
      } else {
        return LoginState(userId: '');
      }
    } catch (e) {
      print('Error with login is $e');
      return LoginState(userId: '');
    }
  }
}
