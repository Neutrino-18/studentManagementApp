import "package:app_crt/Common/Constants/names.dart";
import "package:app_crt/Modals/announcements.dart";
import "package:app_crt/Providers/announcement_provider.dart";
import "package:app_crt/Providers/login_info.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SecondScreen extends ConsumerStatefulWidget {
  const SecondScreen({super.key});

  @override
  ConsumerState<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends ConsumerState<SecondScreen> {
  final _newAnnouncement = TextEditingController();

  void _validatAnnouncement(String announcement) {
    final textColor = Theme.of(context).colorScheme.onBackground;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Are you Sure!?",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: textColor)),
        content: Text(
          "This message cannot be unsent. So please check again",
          style:
              Theme.of(context).textTheme.bodyLarge!.copyWith(color: textColor),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: textColor),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                ref
                    .read(announcementProvider.notifier)
                    .announcementPoster(announcement);
              },
              child: Text(
                "Confirm",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: textColor),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(context) {
    print("Watched Announcements");
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
        data: (announcements) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  // padding:
                  //   const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
                  itemCount: announcements.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 12),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),

                            // textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (ref.read(loginProvider).role == Navigation.tpo)
                TextField(
                  controller: _newAnnouncement,
                  keyboardType: TextInputType.text,
                  onSubmitted: _validatAnnouncement,
                  decoration: InputDecoration(
                    label: Text(
                      "Announce Something",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
