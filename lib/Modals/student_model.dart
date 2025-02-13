class StudentModel {
  StudentModel({
    required this.name,
    required this.email,
    required this.rollno,
    required this.branch,
    required this.batchName,
    required this.attendance,
    required this.score,
    required this.tpoName,
    required this.phase,
  });

  final String name;
  final String email;
  final String rollno;
  final String branch;
  final String batchName;
  final int attendance;
  final int score;
  final String tpoName;
  final int phase;

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        name: json['stu_name'],
        email: json['stu_email'],
        rollno: json['rtu_roll_no'],
        branch: json['branch'],
        batchName: json['batch_name'],
        attendance: json['attendance'],
        score: json['score'],
        tpoName: json['tpo_name'],
        phase: json['phase']);
  }
}
