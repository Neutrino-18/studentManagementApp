import 'package:app_crt/Common/Constants/indexes.dart';
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
        _historyIndex.removeRange(0, _historyIndex.length - 1);
      });
    }
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