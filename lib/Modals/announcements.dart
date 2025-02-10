class Announcement {
  const Announcement({required this.content});

  final String content;

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(content: json['message']);
  }
}
