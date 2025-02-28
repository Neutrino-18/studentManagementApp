import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllStudentsHelper {
  Future<List<dynamic>> fetchAllStudents() async {
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
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
