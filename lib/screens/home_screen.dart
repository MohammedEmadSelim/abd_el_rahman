import 'package:abd_el_rahman/screens/display_screen.dart';
import 'package:abd_el_rahman/screens/write_screen.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> screens = [
    WriteScreen(titleApp: 'Write'),
    DisplayScreen(title: 'Display'),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        elevation: 100,
        backgroundColor: Colors.yellow,
        selectedItemColor: yellow,
        currentIndex: selectedIndex ?? 1,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.display_settings),
              label: 'Display',
              backgroundColor: white),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_add),
              label: 'Input',
              backgroundColor: white),
        ],
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: screens[selectedIndex],
    );
  }
}
