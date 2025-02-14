import 'package:app_crt/Student%20Screens/announce_page.dart';
import 'package:app_crt/Student%20Screens/batch_page.dart';
import 'package:app_crt/Widgets/TPOWids/tpo_home_button.dart';
import 'package:flutter/material.dart';

class TPOHomeScreen extends StatelessWidget {
  const TPOHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CAMPUS CONNECT'),
        elevation: 0,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TPOHomeBut(text: 'Attendance', onTap: 1),
            SizedBox(height: 20),
            TPOHomeBut(text: 'Marks', onTap: 2),
            SizedBox(height: 20),
            // TPOHomeBut(text: 'Announcement',onTap: ,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 10,
        child: Icon(
          Icons.chat,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
