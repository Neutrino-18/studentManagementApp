import 'package:app_crt/Common/Constants/api.dart';
import 'package:app_crt/Modals/announcements.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnnouncementHelper {
  /* fetching the announcements from the server */
  Future<List<Announcement>> fetchAnnouncements() async {
    try {
      final url = Uri.parse(announcementFetch);

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Announcement.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load!!");
      }
    } catch (e) {
      print('Request Failed $e');
      return [];
    }
  }

  /* posting the announcements to the server */
  Future<void> postAnnouncements(String announcement, String id) async {
    try {
      final url = Uri.parse(announcementPost);

      final response = await http.post(
        url,
        headers: {"content-type": "application/json"},
        body: jsonEncode(
          {"message": announcement, "sender": id},
        ),
      );
      print(response.body);

      print("The Response of postAnnouncement contains : ${response.body}");
    } catch (e) {
      print("The error with posting announcement is $e");
    }
  }
}
