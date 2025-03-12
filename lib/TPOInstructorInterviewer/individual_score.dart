import 'package:app_crt/Common/Widgets/text_field.dart';
import 'package:app_crt/Modals/student_model.dart';
import 'package:app_crt/StudentScreens/performance_page.dart';
import 'package:app_crt/Widgets/StudentWids/performance_table.dart';
import 'package:flutter/material.dart';

class StudentScore extends StatelessWidget {
  const StudentScore({super.key, required this.studentData});

  final StudentModel studentData;

  @override
  Widget build(BuildContext context) {
    const List<PerformanceData> ifEmpty = [];
    return Scaffold(
      appBar: AppBar(
        title: Text(studentData.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 154, 191, 233),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SummaryInfo(label: "Roll no:", value: studentData.rollno),
                      SummaryInfo(
                          label: "Batch Name:", value: studentData.batchName),
                      SummaryInfo(
                          label: "Score:", value: studentData.score.toString()),
                      SummaryInfo(
                          label: "HR Interviewer:",
                          value: studentData.hrPerform.first.interviewerName ??
                              ""),
                      SummaryInfo(
                          label: "Phase:", value: studentData.phase.toString()),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownTableWidget(
                dropDownTitle: hrTableTitle,
                tableData: studentData.hrPerform.isEmpty
                    ? ifEmpty
                    : studentData.hrPerform,
                index: 0,
              ),
              DropdownTableWidget(
                tableData: studentData.gdPerform.isEmpty
                    ? ifEmpty
                    : studentData.gdPerform,
                dropDownTitle: gdTableTitle,
                index: 1,
              ),
              DropdownTableWidget(
                tableData: studentData.techPerform.isEmpty
                    ? ifEmpty
                    : studentData.techPerform,
                dropDownTitle: techTableTitle,
                index: 2,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Enter '),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryInfo extends StatelessWidget {
  const SummaryInfo({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
