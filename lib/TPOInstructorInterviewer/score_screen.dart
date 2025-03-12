import 'package:app_crt/Providers/all_students_provider.dart';
import 'package:app_crt/Providers/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreScreen extends ConsumerWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(context, WidgetRef ref) {
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
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(data[index].name),
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
