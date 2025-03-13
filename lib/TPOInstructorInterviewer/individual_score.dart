import 'package:app_crt/Common/Constants/names.dart';
import 'package:app_crt/Modals/interviewer.dart';
import 'package:app_crt/Modals/student_model.dart';
import 'package:app_crt/StudentScreens/performance_page.dart';
import 'package:app_crt/Widgets/StudentWids/performance_table.dart';
import 'package:flutter/material.dart';

class StudentScore extends StatelessWidget {
  const StudentScore(
      {super.key, required this.studentData, required this.interviewerData});

  final StudentModel studentData;
  final Interviewer interviewerData;

  @override
  Widget build(BuildContext context) {
    final Map<Map<IconData, String>, List<PerformanceData>> interviewerInfo = {
      {Icons.group: "GD/Extempore"}: studentData.gdPerform,
      {Icons.man: "Hr"}: studentData.hrPerform,
    };
    Map<IconData, String> some = {
      Icons.computer: "Tech",
    };
    List<PerformanceData> something = studentData.techPerform;

    if (interviewerData.subject == SubjectCategory.gdExtempore) {
      some = interviewerInfo.keys.first;
      something = interviewerInfo.values.first;
    } else if (interviewerData.subject == SubjectCategory.hr) {
      some = interviewerInfo.keys.last;
      something = interviewerInfo.values.last;
    }
    const List<PerformanceData> ifEmpty = [];
    return Scaffold(
      appBar: AppBar(
        title: Text(studentData.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 170,
              width: double.infinity,
              color: Theme.of(context).colorScheme.secondary,
              child: Text("Hello"),
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultTabController(
              animationDuration: Duration(milliseconds: 300),
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      dividerHeight: 40,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(
                          icon: Icon(some.keys.single),
                          text: some.values.single,
                        ),
                        Tab(
                          icon: Icon(Icons.edit),
                          text: "Enter Marks",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: PageScrollPhysics(),
                        children: [
                          DropdownTableWidget(
                              dropDownTitle: 'Current Performance',
                              tableData:
                                  something.isEmpty ? ifEmpty : something,
                              index: 0),
                          Text('nig'),
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
