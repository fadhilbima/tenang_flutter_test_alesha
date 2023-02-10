import 'package:flutter/material.dart';
import 'package:tenang_flutter_test/appointment/screens/appointment_page.dart';
import 'package:tenang_flutter_test/home/screens/home_page.dart';
import 'package:tenang_flutter_test/inbox/screens/inbox_page.dart';
import 'package:tenang_flutter_test/profile/screens/profile_page.dart';

class MainMenu extends StatefulWidget {
  MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _currentIndex = 0;

  final List<Widget> _mainMenu = [
    HomePrep(),
    AppointmentPage(),
    InboxPage(),
    ProfilePrep(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainMenu[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
