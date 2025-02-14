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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.purple,
                elevation: 8,
                shadowColor: Colors.purple.withOpacity(0.5),
              ),
              child: const Text(
                'Explore',
                style: TextStyle(fontSize: 20, letterSpacing: 1.2),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.blue,
                elevation: 8,
                shadowColor: Colors.blue.withOpacity(0.5),
              ),
              child: const Text(
                'Create',
                style: TextStyle(fontSize: 20, letterSpacing: 1.2),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.deepPurple,
                elevation: 8,
                shadowColor: Colors.deepPurple.withOpacity(0.5),
              ),
              child: const Text(
                'Profile',
                style: TextStyle(fontSize: 20, letterSpacing: 1.2),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.purple,
          elevation: 8,
          child: const Icon(Icons.add, size: 28),
        ),
      ),
    );
  }
}
