class Interviewer {
  final int id;
  final String name;
  final String email;
  final String subject;
  final String interviewer;

  Interviewer({
    required this.id,
    required this.name,
    required this.email,
    required this.subject,
    required this.interviewer,
  });

  factory Interviewer.fromJson(Map<String, dynamic> json) {
    return Interviewer(
      id: json['id'],
      name: json['inter_name'],
      email: json['inter_email'],
      subject: json['sub'],
      interviewer: json['interviewer'],
    );
  }
}
