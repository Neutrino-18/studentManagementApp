import 'package:app_crt/Modals/announcements.dart';
import 'package:app_crt/Repos/db_helper.dart';
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

// final announcementProvider =
//     StateNotifierProvider<AnnouncementNotifier, List<Announcement>>(
//   (ref) => AnnouncementNotifier(),
// );

final apiServiceProvider = Provider<ApiHelper>((ref) => ApiHelper());

final announcementProvider = FutureProvider<List<Announcement>>((ref) async {
  final apiService = ref.read(apiServiceProvider);

  return apiService.fetchAnnouncements();
});
