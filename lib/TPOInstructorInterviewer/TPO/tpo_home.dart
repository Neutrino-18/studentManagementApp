import 'package:app_crt/Common/Constants/indexes.dart';
import 'package:app_crt/Common/Constants/names.dart';
import 'package:app_crt/Providers/index_provider.dart';
import 'package:app_crt/Providers/login_info.dart';
import 'package:app_crt/Widgets/TPOWids/tpo_home_button.dart';
import 'package:flutter/material.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TPOHomeBut(
                text: 'Attendance', onTap: ConstIndex.profileAttendanceIndex),
            const SizedBox(height: 20),
            if (ref.read(loginProvider).role == NavigationConsts.tpoRole)
              const TPOHomeBut(
                  text: 'Score', onTap: ConstIndex.marksNotesIndex),
            const SizedBox(height: 20),
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
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
