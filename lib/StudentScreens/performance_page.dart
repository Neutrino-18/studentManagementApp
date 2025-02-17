import 'package:app_crt/Providers/index_provider.dart';
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
      body: const SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            SizedBox(height: 20),
            DropdownTableWidget(
              dropDownTitle: hrTableTitle,
              index: 0,
            ),
            DropdownTableWidget(
              dropDownTitle: gdTableTitle,
              index: 1,
            ),
            DropdownTableWidget(
              dropDownTitle: techTableTitle,
              index: 2,
            ),
          ],
        ),
      ),
    );
  }
}
