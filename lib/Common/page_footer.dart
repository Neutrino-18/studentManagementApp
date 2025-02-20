import 'package:app_crt/Common/Constants/indexes.dart';
import 'package:app_crt/Common/Constants/names.dart';
import 'package:app_crt/Common/Constants/screens.dart';
import 'package:app_crt/Modals/login.dart';
import 'package:app_crt/Providers/login_info.dart';
import 'package:app_crt/Providers/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconFooter extends ConsumerStatefulWidget {
  const IconFooter({super.key});

  @override
  ConsumerState<IconFooter> createState() => _IconFooterState();
}

class _IconFooterState extends ConsumerState<IconFooter> {
  LoginState? _loginDetails;
  @override
  void initState() {
    super.initState();
    final loginDetails = ref.read(loginProvider);
//setState(() {
    _loginDetails = loginDetails;
    // });
  }

  List<Widget> _screens = [];
  List<BottomNavigationBarItem> _items = [];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabIndex = ref.watch(indexProvider);

    print("Tab Index is $tabIndex");

    if (_loginDetails!.role == Navigation.tpo ||
        _loginDetails!.role == Navigation.editor) {
      _screens = tpoScreens;
      _items = tpoItems;
      _currentIndex = tabIndex > ConstIndex.batchIndex ? 0 : tabIndex;
    } else {
      _screens = studentScreens;
      _items = studentItems;
      _currentIndex =
          tabIndex > ConstIndex.profileAttendanceIndex ? 0 : tabIndex;
    }

    return Scaffold(
      body: _screens[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
          onTap: (index) {
            ref.read(indexProvider.notifier).state = index;
          },
          showSelectedLabels: tabIndex >= 3 ? true : false,
          showUnselectedLabels: true,
          enableFeedback: false,
          items: _items),
    );
  }
}
// [
//           BottomNavigationBarItem(
//             icon: const Icon(
//               FontAwesomeIcons.house,
//               size: 20,
//             ),
//             label: 'Home',
//             backgroundColor: backColor,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(FeatherIcons.activity),
//             label: 'Announcements',
//             backgroundColor: backColor,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(FontAwesomeIcons.peopleGroup),
//             label: 'Batch',
//             backgroundColor: backColor,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.account_circle),
//             label: 'Profile',
//             backgroundColor: backColor,
//           ),
//         ],