import 'package:app_crt/Modals/announcements.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  static const String _baseURL = "http://127.0.0.1:8000";
  static const String _announcement =
      "$_baseURL/schedule/get/flutr/announcements/";

  Future<List<Announcement>> fetchAnnouncements() async {
    final response = await http.get(Uri.parse(_announcement));
    print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Announcement.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load");
    }
  }
}
