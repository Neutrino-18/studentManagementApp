import 'package:app_crt/Providers/login_info.dart';
import 'package:app_crt/Student%20Screens/announce_page.dart';
import 'package:app_crt/Student%20Screens/batch_page.dart';
import 'package:app_crt/Student%20Screens/first_page.dart';
import 'package:app_crt/Student%20Screens/performance_page.dart';
import 'package:app_crt/Student%20Screens/profile_page.dart';
import 'package:app_crt/Providers/index_provider.dart';
import 'package:app_crt/TPO%20Instructor/TPO/tpo_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class IconFooter extends ConsumerWidget {
  IconFooter({super.key});

  final List<Widget> screens = [
    const BeginScreen(),
    const SecondScreen(),
    const ThirdScreen(),
    const ProfileScreen(),
    const StudentPerformance(),
  ];

  final List<Widget> tpoScreens = [
    const TPOHomeScreen(),
    const SecondScreen(),
    const ThirdScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(indexProvider);
    final secTabIndex = ref.watch(loginProvider);
    print("Tab Index is $tabIndex");
    var backColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      body:
          secTabIndex.role == 'tpo' ? tpoScreens[tabIndex] : screens[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: tabIndex == 4 ? 0 : tabIndex,
        onTap: (index) {
          ref.read(indexProvider.notifier).state = index;
        },
        showSelectedLabels: tabIndex == 4 ? true : false,
        showUnselectedLabels: true,
        enableFeedback: false,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              FontAwesomeIcons.house,
              size: 20,
            ),
            label: 'Home',
            backgroundColor: backColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(FeatherIcons.activity),
            label: 'Announcements',
            backgroundColor: backColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.peopleGroup),
            label: 'Batch',
            backgroundColor: backColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: 'Profile',
            backgroundColor: backColor,
          ),
        ],
      ),
    );
  }
}
