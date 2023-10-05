import 'package:flutter/material.dart';

import 'colors.dart';
import 'display_screen.dart';
import 'write_screen.dart';

class NavBar extends StatelessWidget {
  int selectedIndex;
  NavBar({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: BottomNavigationBar(
        unselectedItemColor: black,
        elevation: 100,
        backgroundColor: navBarColor,
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
          if (value == 0) {
            selectedIndex = 0;
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DisplayScreen(title: 'Display');
            }));
          } else if (value == 1) {
            selectedIndex = 1;
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WriteScreen(titleApp: 'Input');
            }));
          }
        },
      ),
    );
  }
}
