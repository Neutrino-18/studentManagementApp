import 'package:app_crt/Widgets/TPOWids/tpo_home_button.dart';
import 'package:flutter/material.dart';

class TPOHomeScreen extends StatelessWidget {
  const TPOHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CAMPUS CONNECT',
        ),
        elevation: 0,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TPOHomeBut(text: 'Attendance'),
            SizedBox(height: 20),
            TPOHomeBut(text: 'Marks'),
            SizedBox(height: 20),
            TPOHomeBut(text: 'Announcement'),
          ],
        ),
      ),
    );
  }
}
