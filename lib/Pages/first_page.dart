import "package:app_crt/Common/box_prop.dart";
import "package:app_crt/Extra/scrollable_box.dart";
import "package:app_crt/Providers/announcement_provider.dart";
import "package:app_crt/Providers/index_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:intl/intl.dart';

//
//
//
const announcementPageIndex = 1;
const batchPageIndex = 2;
final now = DateTime.now();
String formattedDate = DateFormat('MMMM d, y').format(now);
//

class BeginScreen extends ConsumerWidget {
  const BeginScreen({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final topAnnouncements = ref
        .watch(announcementProvider)
        .whenData((announcement) => announcement.first.content);

    return Scaffold(
      appBar: AppBar(
        title: const Text("TEST IT"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            BoxProp(
              onPressed: () {
                ref.read(indexProvider.notifier).state = announcementPageIndex;
              },
              headingText: 'Announcement',
              contentText: topAnnouncements.value != null
                  ? topAnnouncements.value.toString()
                  : "Connection Issue",
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Schedule',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                const Spacer(),
                Text(
                  formattedDate,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                )
              ],
            ),
            const AnimatedBoxScreen(),
            const SizedBox(height: 20),
            BoxProp(
              onPressed: () {
                ref.read(indexProvider.notifier).state = batchPageIndex;
              },
              headingText: 'Batch Msg',
              contentText:
                  'You are adviced not to pretend like somebody else or else you will not be given freedom',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(indexProvider.notifier).state = 4;
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.square(165),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // padding: const EdgeInsets.symmetric(
                    //     horizontal: 40, vertical: 40),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.speed,
                        color: Theme.of(context).colorScheme.background,
                        size: 80,
                      ),
                      Text(
                        'Performance',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
                //const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.square(165),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // padding: const EdgeInsets.symmetric(
                    //     horizontal: 40, vertical: 40),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.menu_book,
                        color: Theme.of(context).colorScheme.background,
                        size: 80,
                      ),
                      Text(
                        'Notes',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
