import 'package:app_crt/Providers/all_students_provider.dart';
import 'package:app_crt/Providers/index_provider.dart';
import 'package:app_crt/StudentScreens/performance_page.dart';
import 'package:app_crt/TPOInstructorInterviewer/individual_score.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreScreen extends ConsumerWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    print("Built Score Screen");
    final allStudents = ref.watch(allStudentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Score"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            ref.read(historyProvider.notifier).updateIndex(0, ref);
          },
        ),
      ),
      body: allStudents.when(
        data: (students) => ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StudentScore(studentData: students[index]),
                  ));
            },
            child: ListTile(
              title: Text(students[index].name),
            ),
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Text("Error $error"),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
/* SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ), */
