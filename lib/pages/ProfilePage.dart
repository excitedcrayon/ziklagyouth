import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:ziklagyouth/config/config.dart';
import 'package:ziklagyouth/pages/ProfileSubPages/LoginPage.dart';
import 'package:ziklagyouth/pages/ProfileSubPages/RegisterPage.dart';
import 'package:ziklagyouth/provider/UserNotifier.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final userNotifier = Provider.of<UserNotifier>(context);
    userNotifier.getUserData();

    return SafeArea(
      child: Scaffold(
        body: ( userNotifier.userData.isNotEmpty )
            ? loggedInProfile(userNotifier)
            : loggedOutProfile(context),
      ),
    );
  }
  
  Column loggedInProfile(UserNotifier userNotifier) {
    return Column(
      children: <Widget>[
        settingsSection(),
        logout(userNotifier),
      ],
    );
  }

  Container settingsSection(){
    return Container(
      width: double.infinity,
      height: Config.defaultPadding * 4.5,
      decoration: const BoxDecoration(
        color: Color(Config.colorGold),
      ),
      child: const Padding(
        padding: EdgeInsets.all(Config.defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Settings',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Config.defaultPadding * 1.2
              ),
            ),
            InkWell(
              child: Icon(
                Icons.settings,
                size: Config.iconSize * 1.5,
              ),
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton logout(UserNotifier userNotifier) {

    userNotifier.getUserData();
    var data = jsonDecode(userNotifier.userData);

    return ElevatedButton(

      onPressed: () async {
        // send http request to logout link
        await http.post(
          Uri.parse(Config.logoutLink),
          body: {
            "email": data[Config.email] as String
          }
        ).then((response) {

          if ( response.body.isNotEmpty ) {
            final decodedLogout = jsonDecode(response.body);
            if ( decodedLogout['logout']['success'] ) userNotifier.setLoggedOut();
          }

        });
      },
      child: const Center(
        child: Text('Logout'),
      ),
    );
  }

  Center loggedOutProfile(BuildContext context){
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <ElevatedButton>[
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage())
                );
              },
              child: const Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage())
                );
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
