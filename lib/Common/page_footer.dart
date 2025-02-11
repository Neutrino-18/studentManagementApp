import 'package:app_crt/Pages/announce_page.dart';
import 'package:app_crt/Pages/batch_page.dart';
import 'package:app_crt/Pages/first_page.dart';
import 'package:app_crt/Pages/performance_page.dart';
import 'package:app_crt/Pages/profile_page.dart';
import 'package:app_crt/Providers/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

final GlobalKey<IconFooterState> iconFooterKey = GlobalKey<IconFooterState>();

class IconFooter extends ConsumerStatefulWidget {
  const IconFooter({super.key});
  @override
  ConsumerState<IconFooter> createState() {
    return IconFooterState();
  }
}

class IconFooterState extends ConsumerState<IconFooter> {
  final List<Widget> screens = [
    const BeginScreen(),
    const SecondScreen(),
    const ThirdScreen(),
    const ProfileScreen(),
    const StudentPerformance(),
  ];

  @override
  Widget build(BuildContext context) {
    final tabIndex = ref.watch(indexProvider);
    print("Tab Index is $tabIndex");
    var backColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      body: screens[tabIndex],
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
