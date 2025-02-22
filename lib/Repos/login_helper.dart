import 'package:app_crt/Common/Constants/api.dart';
import 'package:app_crt/Modals/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginHelper {
  Future<LoginState> login(String email, String rollno) async {
    try {
      final response = await http.post(
        Uri.parse(loginFetch),
        headers: {"content-type": "application/json"},
        body: jsonEncode(
          {"email": email, "password": rollno},
        ),
      );
      // print(email);
      // print(rollno);

      // print('THE RESPONSE IS : ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // print(data);
        final filteredData = LoginState.fromJson(data);

        // print('The userID is : ${filteredData.userId}');
        return filteredData;
      } else {
        return LoginState(userId: '');
      }
    } catch (e) {
      print('Error with login is: $e');
      return LoginState(userId: '');
    }
  }
}
