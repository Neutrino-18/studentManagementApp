import 'dart:convert';
import 'package:app_crt/Common/Constants/api.dart';
import 'package:app_crt/Modals/interviewer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InterviewerHelper {
  Future<Interviewer> fetchInterviewer(String interId) async {
    try {
      final url = Uri.parse('$allInterviewerFetch$interId');

      final response = await http.get(url);
      if (response.statusCode == 200) {
        debugPrint("Response is : ${response.body}");
        final data = Interviewer.fromJson(jsonDecode(response.body));

        return data;
      } else {
        throw Exception("Failed to load!! ${response.statusCode}");
      }
    } catch (e) {
      debugPrint('Request Failed in InterviewerHelper $e');
      throw Exception("Server error");
    }
  }
}
