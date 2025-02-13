// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentModelImpl _$$StudentModelImplFromJson(Map<String, dynamic> json) =>
    _$StudentModelImpl(
      student: json['student'] as String,
      stuName: json['stuName'] as String,
      stuEmail: json['stuEmail'] as String,
      rtuRollNo: json['rtuRollNo'] as String,
      branch: json['branch'] as String,
      attendance: (json['attendance'] as num).toInt(),
      score: (json['score'] as num).toInt(),
      tpoName: json['tpoName'] as String,
      phase: (json['phase'] as num).toInt(),
      techPerformanceData: (json['techPerformanceData'] as List<dynamic>)
          .map((e) => PerformanceData.fromJson(e as Map<String, dynamic>))
          .toList(),
      hrPerformanceData: (json['hrPerformanceData'] as List<dynamic>)
          .map((e) => PerformanceData.fromJson(e as Map<String, dynamic>))
          .toList(),
      gdPerformanceData: (json['gdPerformanceData'] as List<dynamic>)
          .map((e) => PerformanceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StudentModelImplToJson(_$StudentModelImpl instance) =>
    <String, dynamic>{
      'student': instance.student,
      'stuName': instance.stuName,
      'stuEmail': instance.stuEmail,
      'rtuRollNo': instance.rtuRollNo,
      'branch': instance.branch,
      'attendance': instance.attendance,
      'score': instance.score,
      'tpoName': instance.tpoName,
      'phase': instance.phase,
      'techPerformanceData': instance.techPerformanceData,
      'hrPerformanceData': instance.hrPerformanceData,
      'gdPerformanceData': instance.gdPerformanceData,
    };

_$PerformanceDataImpl _$$PerformanceDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceDataImpl(
      interviewer: json['interviewer'] as String?,
      date: json['date'] as String?,
      round: json['round'] as String?,
      remark: json['remark'] as String?,
      score: (json['score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PerformanceDataImplToJson(
        _$PerformanceDataImpl instance) =>
    <String, dynamic>{
      'interviewer': instance.interviewer,
      'date': instance.date,
      'round': instance.round,
      'remark': instance.remark,
      'score': instance.score,
    };
