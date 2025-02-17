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
    required this.techPerform,
    required this.gdPerform,
    required this.hrPerform,
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
  final List<PerformanceData> techPerform;
  final List<PerformanceData> gdPerform;
  final List<PerformanceData> hrPerform;

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
      phase: json['phase'],
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
  final String interviewer;
  final String date;
  final String round;
  final String remark;
  final int score;

  PerformanceData({
    required this.interviewer,
    required this.date,
    required this.round,
    required this.remark,
    required this.score,
  });

  factory PerformanceData.fromJson(Map<String, dynamic> json) {
    return PerformanceData(
      interviewer: json['interviewer'],
      date: json['date'],
      round: json['round'],
      remark: json['remark'],
      score: json['score'],
    );
  }
}
