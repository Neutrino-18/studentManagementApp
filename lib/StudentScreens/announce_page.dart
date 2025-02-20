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
  AsyncValue<List<Announcement>> _announcements = const AsyncValue.data([]);
  final _newAnnouncement = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final announcements = await ref.read(announcementProvider.future);
      setState(() {
        _announcements = AsyncValue.data(announcements);
      });
    });
  }

  @override
  Widget build(context) {
    final tileColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Announcement"),
      ),
      body: _announcements.when(
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
                  decoration: InputDecoration(
                      label: Text(
                        "Announce Something",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).colorScheme.onBackground))),
                )
            ],
          ),
        ),
      ),
    );
  }
}
