import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:ziklagyouth/config/config.dart';
import 'package:ziklagyouth/pages/ContactsPage.dart';
import 'package:ziklagyouth/pages/HomePage.dart';
import 'package:ziklagyouth/pages/MediaPage.dart';
import 'package:ziklagyouth/pages/ProfilePage.dart';
import 'package:ziklagyouth/provider/UserNotifier.dart';

class MainPage extends StatefulWidget {

  const MainPage({super.key});

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

  Future<void> authentication(BuildContext context, UserNotifier userNotifier) async {

    userNotifier.getUserData();
    var decodedUserData = (userNotifier.userData.isNotEmpty) ? jsonDecode(userNotifier.userData) : "";

    await http.post(
      Uri.parse(Config.authenticated),
      body: {
        "authCookieToken": (userNotifier.userData.isNotEmpty && decodedUserData[Config.authCookieToken].isNotEmpty) ? decodedUserData[Config.authCookieToken] : null,
        "email": (userNotifier.userData.isNotEmpty && decodedUserData[Config.email].isNotEmpty) ? decodedUserData[Config.email] : null
      }
    ).then((response) {

      if ( response.body.isNotEmpty ) {

        final decodedAuthentication = jsonDecode(response.body);

        // if authCookie is not valid, clear local shared preferences for user data login
        if ( !decodedAuthentication['authenticated']['status'] ) {
          userNotifier.setLoggedOut();
        }

      }

    }).catchError((error) {});

  }

  @override
  Widget build(BuildContext context) {

    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;

    final userNotifier = Provider.of<UserNotifier>(context);

    authentication(context, userNotifier);

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
