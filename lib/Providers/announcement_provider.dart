import 'dart:async';
import 'package:app_crt/Modals/announcements.dart';
import 'package:app_crt/Providers/login_info.dart';
import 'package:app_crt/Repos/announcement_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final announcementGiver = AnnouncementHelper();

class AnnouncementNotifier extends AsyncNotifier<List<Announcement>> {
  @override
  FutureOr<List<Announcement>> build() async {
    /* calling and awaiting the fetcher */
    return await announcementGiver.fetchAnnouncements();
  }

  /* method to post the announcement */
  Future<void> announcementPoster(String announcement) async {
    final id = ref.read(loginProvider).userId;
    print("Awaiting the announcement Provider");
    state = const AsyncValue.loading();
    try {
      /* calling and awaiting the poster */
      await announcementGiver.postAnnouncements(announcement, id);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
    print("Awaited the provider");
  }
}

/* provider for the announcement notifier */
final announcementProvider =
    AsyncNotifierProvider<AnnouncementNotifier, List<Announcement>>(
  () => AnnouncementNotifier(),
);







/* class AnnouncementNotifier extends StateNotifier<List<Announcement>> {
  AnnouncementNotifier()
      : super([
          const Announcement(content: 'You will never go there nigga'),
          const Announcement(content: 'Niigaaaaa')
        ]);

  void _addAnnouncements(String title, String content) {
    final newAnnouncement = Announcement(content: content);

    state = [...state, newAnnouncement];
  }
}

final announcementProvider = Provider<List<Announcement>>(
  (ref) => [const Announcement(content: 'Hello')],
);

final apiServiceProvider = Provider<AnnouncementHelper>((ref) {
  // print('Reached Provider');
  return AnnouncementHelper();
});

final announcementProvider = FutureProvider<List<Announcement>>((ref) async {
  // print('Reached Future provider');
  final apiService = ref.watch(apiServiceProvider);

  return apiService.fetchAnnouncements();
}); */