// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<void> login(String email, String password, BuildContext context) async {
//   final url = Uri.parse('http://127.0.0.1:8000/login-data');
//   final response = await http.post(
//     url,
//     body: {'email': email, 'password': password},
//   );

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     final role = data['role'];

//     if (role == 'student') {
//       Navigator.pushReplacementNamed(context, '/studentPage');
//     } else if (role == 'interviewer') {
//       Navigator.pushReplacementNamed(context, '/interviewerPage');
//     } else if (role == 'TPO') {
//       Navigator.pushReplacementNamed(context, '/tpoPage');
//     }
//   } else {
//     final error = json.decode(response.body)['error'];
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
//   }
// }
