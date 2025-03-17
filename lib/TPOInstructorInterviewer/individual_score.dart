import 'package:app_crt/Common/Constants/names.dart';
import 'package:app_crt/Modals/interviewer.dart';
import 'package:app_crt/Modals/student_model.dart';
import 'package:app_crt/Providers/single_student_data.dart';
import 'package:app_crt/Widgets/StudentWids/performance_table.dart';
import 'package:app_crt/student_score_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentScore extends ConsumerStatefulWidget {
  const StudentScore(
      {super.key, required this.studentData, required this.interviewerData});

  final StudentModel studentData;
  final Interviewer interviewerData;

  @override
  ConsumerState<StudentScore> createState() => _StudentScoreState();
}

class _StudentScoreState extends ConsumerState<StudentScore> {
  late List<PerformanceData> studentPerformanceData;
  late String focusedTab;
  IconData icon = Icons.computer;

  @override
  void initState() {
    super.initState();
    final some = ref.read(singleStudentDataProvider);
    studentPerformanceData = some.values.first;
    focusedTab = some.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    icon = focusedTab == SubjectCategory.gdExtempore
        ? Icons.group
        : focusedTab == SubjectCategory.hr
            ? Icons.man
            : icon;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.studentData.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 170,
              width: double.infinity,
              color: Theme.of(context).colorScheme.secondary,
              child: const Text("Hello"),
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultTabController(
              animationDuration: const Duration(milliseconds: 300),
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      dividerHeight: 40,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(
                          icon: Icon(icon),
                          text: focusedTab,
                        ),
                        const Tab(
                          icon: Icon(Icons.edit),
                          text: "Enter Results",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const PageScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 40),
                            child: DropdownTableWidget(
                                dropDownTitle: 'Current Performance',
                                tableData: studentPerformanceData,
                                index: 0),
                          ),
                          StudentScoreTestField(
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
/*height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
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
                        value:
                            studentData.hrPerform.first.interviewerName ?? ""),
                    SummaryInfo(
                        label: "Phase:", value: studentData.phase.toString()),
                  ],
                ),
                
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

 

                 */
