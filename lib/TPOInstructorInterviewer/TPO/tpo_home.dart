import 'package:app_crt/Common/Constants/indexes.dart';
import 'package:app_crt/Providers/index_provider.dart';
import 'package:app_crt/Widgets/TPOWids/tpo_home_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TPOHomeScreen extends ConsumerWidget {
  const TPOHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CAMPUS CONNECT'),
        elevation: 0,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TPOHomeBut(
                text: 'Attendance', onTap: ConstIndex.profileAttendanceIndex),
            SizedBox(height: 20),
            TPOHomeBut(text: 'Marks', onTap: ConstIndex.marksNotesIndex),
            SizedBox(height: 20),
            // Stack(
            //   children: [
            //     Container(
            //       height: 100,
            //       width: 100,
            //       decoration: const BoxDecoration(color: Colors.yellow,borderRadius: ),
            //       child: const Center(
            //         child: Text(
            //           "nigga",
            //           style: TextStyle(color: Colors.blue),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(historyProvider.notifier)
              .updateIndex(ConstIndex.announcementIndex, ref);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 10,
        child: Icon(
          Icons.chat,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
