import 'package:app_crt/Modals/announcements.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnnouncementHelper {
  // static const String _baseURL = "http://127.0.0.1:8000";
  // static const String _announcement =
  //     "$_baseURL/schedule/get/flutr/announcements/";

  Future<List<Announcement>> fetchAnnouncements() async {
    // print('fetcher reached');
    try {
      final url = Uri.parse(
          'http://192.168.141.15:8000/schedule/get/flutr/announcements/');

      final response = await http.get(url);
      // print(response.statusCode);
      // print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Announcement.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load!!");
      }
    } catch (e) {
      // print('Request Failed $e');
      return [];
    }
  }

  void postAnnouncements(String announcement) async {
    try {
      final url = Uri.parse(
          'http://192.168.141.15:8000/schedule/post/flutr/announcement/');

      final response = await http.post(
        url,
        headers: {"content-type": "application/json"},
        body: jsonEncode(
          {"message": announcement},
        ),
      );

      print("The Response contains : ${response.body}");
    } catch (e) {
      print("The error with posting announcement is $e");
    }
  }
}
