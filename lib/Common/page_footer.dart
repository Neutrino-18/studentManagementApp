import 'package:app_crt/Common/Constants/screens.dart';
import 'package:flutter/material.dart';

class IconFooter extends StatefulWidget {
  const IconFooter({super.key});

  @override
  State<IconFooter> createState() => _IconFooterState();
}

class _IconFooterState extends State<IconFooter> {
  int _currentIndex = 0;
  final List<int> _historyIndex = [0];

  final _screens = studentScreens;
  final _items = studentItems;

  bool _onPopInvoked() {
    if (_historyIndex.last == 0) {
      setState(() {
        _historyIndex.replaceRange(0, _historyIndex.length, []);
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
    print("Kardiya Build ");
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
            showSelectedLabels: _currentIndex >= 3,
            showUnselectedLabels: true,
            enableFeedback: false,
            items: _items),
      ),
    );
  }
}
