class StudentModel {
  StudentModel({
    required this.id,
    required this.uniqueStudentId,
    required this.name,
    required this.email,
    required this.rollno,
    required this.branch,
    required this.batchName,
    required this.batchId,
    required this.attendance,
    required this.score,
    required this.tpoName,
    required this.tpo,
    required this.phase,
    required this.stuCreatedAt,
    required this.techPerform,
    required this.gdPerform,
    required this.hrPerform,
  });
  final int id;
  final String uniqueStudentId;
  final String name;
  final String email;
  final String rollno;
  final String branch;
  final String batchId;
  final String batchName;
  final int attendance;
  final int score;
  final String tpoName;
  final int tpo;
  final int phase;
  final DateTime stuCreatedAt;
  final List<PerformanceData> techPerform;
  final List<PerformanceData> gdPerform;
  final List<PerformanceData> hrPerform;

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      uniqueStudentId: json['student'],
      name: json['stu_name'],
      email: json['stu_email'],
      rollno: json['rtu_roll_no'],
      branch: json['branch'],
      batchName: json['batch_name'],
      batchId: json['batch_id'],
      attendance: json['attendance'],
      score: json['score'],
      tpoName: json['tpo_name'],
      tpo: json['tpo'],
      phase: json['phase'],
      stuCreatedAt: DateTime.parse(json['stu_created_at']),
      techPerform: (json['tech_performance_data'] as List)
          .map((e) => PerformanceData.fromJson(e))
          .toList(),
      gdPerform: (json['hr_performance_data'] as List)
          .map((e) => PerformanceData.fromJson(e))
          .toList(),
      hrPerform: (json['GD_Extemopore_performance_data'] as List)
          .map((e) => PerformanceData.fromJson(e))
          .toList(),
    );
  }
}

class PerformanceData {
  final int id;
  final String stuEmail;
  final String interviewerEmail;
  final String? interviewerName;
  final String? date;
  final String? round;
  final String? remark;
  final int? score;
  final int student;
  final int interviewer;

  PerformanceData({
    required this.id,
    required this.stuEmail,
    required this.interviewerEmail,
    this.interviewerName,
    this.date,
    this.round,
    this.remark,
    this.score,
    required this.student,
    required this.interviewer,
  });

  factory PerformanceData.fromJson(Map<String, dynamic> json) {
    return PerformanceData(
      id: json['id'],
      stuEmail: json['stu_email'],
      interviewerEmail: json['interviewer_email'],
      interviewerName: json['interviewer_name'],
      date: json['date'],
      round: json['round'],
      remark: json['remark'],
      score: json['score'],
      student: json['student'],
      interviewer: json['interviewer'],
    );
  }
}

List<StudentModel> studentListFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => StudentModel.fromJson(json)).toList();
}
