import 'package:app_crt/Common/Constants/api.dart';
import 'package:app_crt/Modals/student_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllStudentsHelper {
  Future<List<StudentModel>> fetchAllStudents() async {
    try {
      final url = Uri.parse(allStudentFetch);

      final response = await http.get(url);
      if (response.statusCode == 200) {
        print("Response is : ${response.body}");
        final data = studentListFromJson(jsonDecode(response.body));

        return data;
      } else {
        throw Exception("Failed to load!!");
      }
    } catch (e) {
      debugPrint('Request Failed $e');
      return [];
    }
  }
}
