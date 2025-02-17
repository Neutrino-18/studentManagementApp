import 'package:app_crt/Providers/index_provider.dart';
import 'package:app_crt/Providers/student_data_provider.dart';
import 'package:app_crt/Widgets/StudentWids/performance_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const String hrTableTitle = "HR Performance";
const String gdTableTitle = "GD Performance";
const String techTableTitle = "Tech Performance";

class StudentPerformance extends ConsumerWidget {
  const StudentPerformance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentPerformance = ref.watch(studentDataProvider);

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
        body: studentPerformance.when(
          data: (studentData) => SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Card(
                  child: RichText(
                    text: TextSpan(
                      text: 'Overall Performane',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: const [
                        TextSpan(text: 'Student '),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownTableWidget(
                  dropDownTitle: hrTableTitle,
                  tableData: studentData!.hrPerform,
                  index: 0,
                ),
                DropdownTableWidget(
                  tableData: studentData.gdPerform,
                  dropDownTitle: gdTableTitle,
                  index: 1,
                ),
                DropdownTableWidget(
                  tableData: studentData.techPerform,
                  dropDownTitle: techTableTitle,
                  index: 2,
                ),
              ],
            ),
          ),
          error: (error, stackTrace) => const Center(
            child: Text("Servers are busy"),
          ),
          loading: () => const CircularProgressIndicator(),
        ));
  }
}
