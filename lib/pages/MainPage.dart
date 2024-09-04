import 'package:flutter/material.dart';
import 'package:ziklagyouth/pages/ContactsPage.dart';
import 'package:ziklagyouth/pages/HomePage.dart';
import 'package:ziklagyouth/pages/MediaPage.dart';
import 'package:ziklagyouth/pages/ProfilePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  late int _selectedIndex = 0;

  void _navigationMenuItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;

    return Material(
      child: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: const <Widget>[
              HomePage(),
              Contactspage(),
              MediaPage(),
              ProfilePage()
            ],
          ),
          bottomNavigationBar: (isKeyboardOpen) ? null : NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _navigationMenuItemTapped,
            destinations: const <NavigationDestination>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home_filled),
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.perm_contact_cal),
                icon: Icon(Icons.perm_contact_cal_outlined),
                label: 'Contacts',
              ),
        
              NavigationDestination(
                selectedIcon: Icon(Icons.ondemand_video_sharp),
                icon: Icon(Icons.personal_video_sharp),
                label: 'Media',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.perm_identity),
                label: 'Profile',
              )
            ],
          ),
        ),
      ),
    );
  }
}
