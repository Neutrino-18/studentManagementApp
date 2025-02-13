import "package:app_crt/Providers/announcement_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SecondScreen extends ConsumerStatefulWidget {
  const SecondScreen({super.key});

  @override
  ConsumerState<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends ConsumerState<SecondScreen> {
  @override
  Widget build(context) {
    final announcements = ref.watch(announcementProvider);
    final tileColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Announcement"),
        ),
        body: announcements.when(
          error: (error, stackTrace) => Center(
            child: Text("Error $error"),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (announcements) => ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
            itemCount: announcements.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 80,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  clipBehavior: Clip.hardEdge,
                  elevation: 5,
                  color: tileColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 15),
                    child: Text(
                      announcements[index].content,
                      style: Theme.of(context).textTheme.titleSmall,
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          ),
        ));
  }
}
