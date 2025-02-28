import 'package:app_crt/Common/Constants/indexes.dart';
import 'package:app_crt/Common/Constants/names.dart';
import 'package:app_crt/Common/Constants/screens.dart';
import 'package:app_crt/Providers/index_provider.dart';
import 'package:app_crt/Providers/login_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconFooter extends ConsumerStatefulWidget {
  const IconFooter({super.key});

  @override
  ConsumerState<IconFooter> createState() => _IconFooterState();
}

class _IconFooterState extends ConsumerState<IconFooter> {
  int _currentIndex = 0;
  // final List<int> _historyIndex = [0];

  List<Widget> _screens = [];
  List<BottomNavigationBarItem> _items = [];

  // bool _onPopInvoked() {
  //   if (_historyIndex.last == 0) {
  //     setState(() {
  //       _historyIndex.replaceRange(0, _historyIndex.length - 1, []);
  //     });
  //   }
  //   // if (_historyIndex.contains(_currentIndex)) {
  //   //   setState(() {
  //   //     _historyIndex.removeWhere((index) => index == _currentIndex);
  //   //   });
  //   // }
  //   if (_historyIndex.length > 1) {
  //     setState(() {
  //       _historyIndex.removeLast();
  //       _currentIndex = _historyIndex.last;
  //     });
  //     return false;
  //   }
  //   return true;
  // }

  // void _updateIndex(int index) {
  //   ref.read(indexProvider);
  //   if (index != _currentIndex) {
  //     _currentIndex = tabIndex;
  //     setState(() {
  //       _historyIndex.add(index);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final loginDetails = ref.watch(loginProvider);
    final tabIndex = ref.watch(indexProvider);
    final historyCare = ref.watch(historyProvider);

    print("Kardiya Build ");
    print("Abhi ka index hai : $tabIndex");
    print("historyCare:  $historyCare");

    if (loginDetails.role == NavigationConsts.tpoRole ||
        loginDetails.role == NavigationConsts.instructorRole) {
      _screens = tpoScreens;
      _items = tpoItems;
      _currentIndex = tabIndex > ConstIndex.batchIndex ? 0 : tabIndex;
    } else {
      _screens = studentScreens;
      _items = studentItems;
      _currentIndex =
          tabIndex > ConstIndex.profileAttendanceIndex ? 0 : tabIndex;
    }
    return PopScope(
      canPop: historyCare.length == 1 ? true : false,
      onPopInvoked: (didPop) {
        ref.read(historyProvider.notifier).onPopInvoked(ref);
      },
      child: Scaffold(
        body: IndexedStack(
          index: tabIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: _currentIndex,
            onTap: (index) {
              ref.read(historyProvider.notifier).updateIndex(index, ref);
            },
            showSelectedLabels: false,
            showUnselectedLabels: true,
            enableFeedback: false,
            items: _items),
      ),
    );
  }
}
