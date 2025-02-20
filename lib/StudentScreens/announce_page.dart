import "package:app_crt/Modals/announcements.dart";
import "package:app_crt/Providers/announcement_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SecondScreen extends ConsumerStatefulWidget {
  const SecondScreen({super.key});

  @override
  ConsumerState<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends ConsumerState<SecondScreen> {
  AsyncValue<List<Announcement>>? _announcements;

  @override
  void initState() {
    super.initState();
    final announcements = ref.read(announcementProvider);

    _announcements = announcements;
  }

  @override
  Widget build(context) {
    final tileColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Announcement"),
      ),
      body: _announcements!.when(
        error: (error, stackTrace) => Center(
          child: Text("Error $error"),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (announcements) => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
          itemCount: announcements.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                clipBehavior: Clip.hardEdge,
                elevation: 5,
                color: tileColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  child: Text(
                    announcements[index].content,
                    style: Theme.of(context).textTheme.titleSmall,

                    // textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
