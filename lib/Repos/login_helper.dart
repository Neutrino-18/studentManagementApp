import 'dart:async';

import 'package:app_crt/Common/Constants/api.dart';
import 'package:app_crt/Modals/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginHelper {
  Future<LoginState> login(String email, String rollno) async {
    try {
      final response = await http
          .post(
            Uri.parse(NetworkKeys.loginFetch),
            headers: {"content-type": "application/json"},
            body: jsonEncode(
              {"email": email, "password": rollno},
            ),
          )
          .timeout(const Duration(seconds: 4));

      print('THE LOGIN RESPONSE IS : ${response.body}');
      print('THE LOGIN STATUS IS : ${response.statusCode}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        final filteredData = LoginState.fromJson(data);

        return filteredData;
      } else {
        print("Entered Else case of helper");
        final Map<String, dynamic> error = jsonDecode(response.body);

        throw error.values.first;
      }
    } on http.ClientException {
      print("Client Exception");
      throw "Unable to connect to the server";
    } on TimeoutException {
      print("Timeout Exception");
      throw Exception("Connection Timed Out");
    } catch (e) {
      print(
          ' Entered catch block of helper. Error with login is: ${e.toString()}');
      rethrow;
    }
  }
}
