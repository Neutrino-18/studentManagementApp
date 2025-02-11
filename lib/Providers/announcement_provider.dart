import 'package:app_crt/Modals/announcements.dart';
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

final apiServiceProvider = Provider<ApiHelper>((ref) {
  // print('Reached Provider');
  return ApiHelper();
});

final announcementProvider = FutureProvider<List<Announcement>>((ref) async {
  // print('Reached Future provider');
  final apiService = ref.watch(apiServiceProvider);

  return apiService.fetchAnnouncements();
});
