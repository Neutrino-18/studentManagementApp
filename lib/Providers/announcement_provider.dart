import 'dart:async';

import 'package:app_crt/Common/Constants/api.dart';
import 'package:app_crt/Modals/announcements.dart';
import 'package:app_crt/Providers/login_info.dart';
import 'package:app_crt/Repos/announcement_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AnnouncementNotifier extends StateNotifier<List<Announcement>> {
//   AnnouncementNotifier()
//       : super([
//           const Announcement(content: 'You will never go there nigga'),
//           const Announcement(content: 'Niigaaaaa')
//         ]);

//   void _addAnnouncements(String title, String content) {
//     final newAnnouncement = Announcement(content: content);

//     state = [...state, newAnnouncement];
//   }
// }

// final announcementProvider = Provider<List<Announcement>>(
//   (ref) => [const Announcement(content: 'Hello')],
// );

// final apiServiceProvider = Provider<AnnouncementHelper>((ref) {
//   // print('Reached Provider');
//   return AnnouncementHelper();
// });

// final announcementProvider = FutureProvider<List<Announcement>>((ref) async {
//   // print('Reached Future provider');
//   final apiService = ref.watch(apiServiceProvider);

//   return apiService.fetchAnnouncements();
// });

final announcementGiver = AnnouncementHelper();

class AnnouncementNotifier extends AsyncNotifier<List<Announcement>> {
  @override
  FutureOr<List<Announcement>> build() async {
    return await announcementGiver.fetchAnnouncements();
  }

  Future<void> announcementPoster(String announcement) async {
    final id = ref.read(loginProvider).userId;
    print("Awaiting the announcement Provider");
    state = const AsyncValue.loading();
    try {
      await announcementGiver.postAnnouncements(announcement, id!);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
    // if (state.value!.contains(Announcement(content: announcement))) {
    //   return;
    // }

    await announcementGiver.postAnnouncements(announcement, id!);
    print("Awaited the provider");
    // print("Started Invalidating");
    // ref.invalidateSelf();
    // print("Invalidated");
  }
}

final announcementProvider =
    AsyncNotifierProvider<AnnouncementNotifier, List<Announcement>>(
  () => AnnouncementNotifier(),
);
