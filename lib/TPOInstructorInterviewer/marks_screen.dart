import 'package:app_crt/Providers/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MarksScreen extends ConsumerWidget {
  const MarksScreen({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marks'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(historyProvider.notifier).updateIndex(0, ref);
          },
        ),
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
