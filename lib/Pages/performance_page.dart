import 'package:app_crt/Modals/student_performance.dart';
import 'package:app_crt/Providers/index_provider.dart';
import 'package:app_crt/Widgets/StudentWids/performance_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentPerformance extends ConsumerWidget {
  const StudentPerformance({super.key});

  // final List<HRPerformance> _hrPerformance = [
  //   HRPerformance(phase: 1, score: 10, date: "2025/01/26", remark: "V.good"),
  //   HRPerformance(phase: 1, score: 8, date: "2025/01/25", remark: "Good")
  // ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: const PerformanceTable(),
    );
  }
}
