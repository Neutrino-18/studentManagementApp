import 'package:app_crt/Common/Constants/indexes.dart';
import 'package:app_crt/Common/Constants/names.dart';
import 'package:app_crt/Common/Constants/screens.dart';
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
  final List<int> _historyIndex = [0];

  List<Widget> _screens = [];
  List<BottomNavigationBarItem> _items = [];

  bool _onPopInvoked() {
    if (_historyIndex.last == 0) {
      setState(() {
        _historyIndex.replaceRange(0, _historyIndex.length - 1, []);
      });
    }
    // if (_historyIndex.contains(_currentIndex)) {
    //   setState(() {
    //     _historyIndex.removeWhere((index) => index == _currentIndex);
    //   });
    // }
    if (_historyIndex.length > 1) {
      setState(() {
        _historyIndex.removeLast();
        _currentIndex = _historyIndex.last;
      });
      return false;
    }
    return true;
  }

  void _updateIndex(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
        _historyIndex.add(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginDetails = ref.watch(loginProvider);
    print("Kardiya Build ");
    if (loginDetails.role == NavigationConsts.tpoRole ||
        loginDetails.role == NavigationConsts.instructorRole) {
      _screens = tpoScreens;
      _items = tpoItems;
      _currentIndex = _currentIndex > ConstIndex.batchIndex ? 0 : _currentIndex;
    } else {
      _screens = studentScreens;
      _items = studentItems;
      _currentIndex =
          _currentIndex > ConstIndex.profileAttendanceIndex ? 0 : _currentIndex;
    }
    return PopScope(
      canPop: _historyIndex.length == 1 ? true : false,
      onPopInvoked: (didPop) {
        _onPopInvoked();
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: _currentIndex,
            onTap: _updateIndex,
            showSelectedLabels: false,
            showUnselectedLabels: true,
            enableFeedback: false,
            items: _items),
      ),
    );
  }
}
