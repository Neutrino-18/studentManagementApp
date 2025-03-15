import 'package:app_crt/Common/Constants/indexes.dart';
import 'package:app_crt/Providers/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendenceScreen extends ConsumerWidget {
  const AttendenceScreen({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        leading: IconButton(
            onPressed: () {
              ref
                  .read(historyProvider.notifier)
                  .updateIndex(ConstIndex.defaultIndex);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
