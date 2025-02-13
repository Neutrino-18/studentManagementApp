import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

@freezed
class StudentModel with _$StudentModel {
  factory StudentModel({
    required String student,
    required String stuName,
    required String stuEmail,
    required String rtuRollNo,
    required String branch,
    required int attendance,
    required int score,
    required String tpoName,
    required int phase,
    required List<PerformanceData> techPerformanceData,
    required List<PerformanceData> hrPerformanceData,
    required List<PerformanceData> gdPerformanceData,
  }) = _StudentModel;

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);
}

@freezed
class PerformanceData with _$PerformanceData {
  factory PerformanceData({
    // required int id,
    // required int student,
    String? interviewer,
    String? date,
    String? round,
    String? remark,
    int? score,
  }) = _PerformanceData;

  factory PerformanceData.fromJson(Map<String, dynamic> json) =>
      _$PerformanceDataFromJson(json);
}
