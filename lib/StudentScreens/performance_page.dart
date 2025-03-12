import 'package:app_crt/Modals/student_model.dart';
import 'package:app_crt/Providers/index_provider.dart';
import 'package:app_crt/Providers/student_data_provider.dart';
import 'package:app_crt/Widgets/StudentWids/performance_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<PerformanceData> _ifEmpty = [];

const String hrTableTitle = "HR Performance";
const String gdTableTitle = "GD Performance";
const String techTableTitle = "Tech Performance";

class StudentPerformance extends ConsumerWidget {
  const StudentPerformance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncStudentData = ref.watch(studentDataProvider);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              ref.read(indexProvider.notifier).state = 0;
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
          title: const Text('Performance'),
        ),
        body: asyncStudentData.when(
          data: (studentData) => SingleChildScrollView(
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
                          buildAlignedText("Roll no:", studentData!.rollno),
                          buildAlignedText(
                              "Batch Name:", studentData.batchName),
                          buildAlignedText(
                              "Score:", studentData.score.toString()),
                          buildAlignedText(
                              "HR Interviewer:",
                              studentData.hrPerform.first.interviewerName ??
                                  ""),
                          buildAlignedText(
                              "Phase:", studentData.phase.toString()),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownTableWidget(
                    dropDownTitle: hrTableTitle,
                    tableData: studentData.hrPerform.isEmpty
                        ? _ifEmpty
                        : studentData.hrPerform,
                    index: 0,
                  ),
                  DropdownTableWidget(
                    tableData: studentData.gdPerform.isEmpty
                        ? _ifEmpty
                        : studentData.gdPerform,
                    dropDownTitle: gdTableTitle,
                    index: 1,
                  ),
                  DropdownTableWidget(
                    tableData: studentData.techPerform.isEmpty
                        ? _ifEmpty
                        : studentData.techPerform,
                    dropDownTitle: techTableTitle,
                    index: 2,
                  ),
                ],
              ),
            ),
          ),
          error: (error, stackTrace) => const Center(
            child: Text("Servers are busy"),
          ),
          loading: () => const CircularProgressIndicator(),
        ));
  }

  Widget buildAlignedText(String label, String value) {
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
