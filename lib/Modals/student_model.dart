import 'package:app_crt/Modals/login.dart';

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
      gdPerform: (json['GD_Extemopore_performance_data'] as List)
          .map((e) => PerformanceData.fromJson(e))
          .toList(),
      hrPerform: (json['hr_performance_data'] as List)
          .map((e) => PerformanceData.fromJson(e))
          .toList(),
    );
  }

  StudentModel copyWith({
    int? id,
    String? uniqueStudentId,
    String? name,
    String? email,
    String? rollno,
    String? branch,
    String? batchId,
    String? batchName,
    int? attendance,
    int? score,
    String? tpoName,
    int? tpo,
    int? phase,
    DateTime? stuCreatedAt,
    List<PerformanceData>? techPerform,
    List<PerformanceData>? gdPerform,
    List<PerformanceData>? hrPerform,
  }) {
    return StudentModel(
      id: id ?? this.id,
      uniqueStudentId: uniqueStudentId ?? this.uniqueStudentId,
      name: name ?? this.name,
      email: email ?? this.email,
      rollno: rollno ?? this.rollno,
      branch: branch ?? this.branch,
      batchName: batchName ?? this.batchName,
      batchId: batchId ?? this.batchId,
      attendance: attendance ?? this.attendance,
      score: score ?? this.score,
      tpoName: tpoName ?? this.tpoName,
      tpo: tpo ?? this.tpo,
      phase: phase ?? this.phase,
      stuCreatedAt: stuCreatedAt ?? this.stuCreatedAt,
      techPerform: techPerform ?? this.techPerform,
      gdPerform: gdPerform ?? this.gdPerform,
      hrPerform: hrPerform ?? this.hrPerform,
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
