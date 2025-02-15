import 'package:app_crt/StudentScreens/announce_page.dart';
import 'package:app_crt/StudentScreens/batch_page.dart';
import 'package:app_crt/StudentScreens/first_page.dart';
import 'package:app_crt/StudentScreens/performance_page.dart';
import 'package:app_crt/StudentScreens/profile_page.dart';
import 'package:app_crt/TPOInstructorInterviewer/TPO/tpo_home.dart';
import 'package:app_crt/TPOInstructorInterviewer/attendance_screen.dart';
import 'package:app_crt/TPOInstructorInterviewer/marks_screen.dart';
import 'package:flutter/material.dart';

//STUDENTS
final List<Widget> studentScreens = [
  const BeginScreen(),
  const SecondScreen(),
  const ThirdScreen(),
  const ProfileScreen(),
  const StudentPerformance(),
];

const List<BottomNavigationBarItem> studentItems = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Announcement"),
  BottomNavigationBarItem(icon: Icon(Icons.people), label: "Batch"),
  BottomNavigationBarItem(icon: Icon(Icons.man), label: "Profile"),
];
/*--------------------------------------------------------------------------*/
//TPO
final List<Widget> tpoScreens = [
  const TPOHomeScreen(),
  const SecondScreen(),
  const ThirdScreen(),
  const AttendenceScreen(),
  const MarksScreen(),
];

const List<BottomNavigationBarItem> tpoItems = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Announcement"),
  BottomNavigationBarItem(icon: Icon(Icons.people), label: "Batch"),
];
