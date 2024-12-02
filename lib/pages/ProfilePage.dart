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
  
  SingleChildScrollView loggedInProfile(UserNotifier userNotifier) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          settingsSection(),
          userProfile(userNotifier),
          //logout(userNotifier),
        ],
      ),
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

  Container userProfile(UserNotifier userNotifier) {

    var data = jsonDecode(userNotifier.userData);

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.symmetric(
                  vertical: Config.iconSize,
                  horizontal: Config.iconSize,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(Config.colorGold),
                  ),
                  borderRadius: BorderRadius.circular(
                      Config.cardWidth
                  ),
                ),
                width: Config.iconMediumSize * 1.2,
                height: Config.iconMediumSize * 1.2,
                child: data['profilePic'] == null
                    ? Image.asset("assets/profile.png")
                    : Image.network(data["profilePic"]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "${data["firstname"]} ${data["lastname"]}",
                      style: const TextStyle(
                        fontSize: Config.headingSizeLarge,
                        fontWeight: FontWeight.w200,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      data["email"],
                      style: const TextStyle(
                        fontSize: Config.headingSizeLarge,
                        fontWeight: FontWeight.w200,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(Config.colorGold)
            ),
            onPressed: (){},
            child: const Text(
              Config.editProfile,
              style: TextStyle(
                color: Color(Config.colorBlack),
                backgroundColor: Color(Config.colorGold),
                fontSize: Config.headingSizeLarge,
                fontWeight: FontWeight.w300
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(Config.defaultPadding),
            child: Column(
              children: [
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    leading: Icon(Icons.favorite_outline),
                    trailing: Icon(Icons.chevron_right),
                    title: Text(
                      "Favourites",
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    leading: Icon(Icons.add_location_alt_outlined),
                    trailing: Icon(Icons.chevron_right),
                    title: Text(
                      "Location",
                    ),
                  ),
                ),
                const Divider(
                  height: 10.0,
                  thickness: 1.0,
                  color: Color(Config.colorDarkGrey),
                ),
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    leading: Icon(Icons.download),
                    trailing: Icon(Icons.chevron_right),
                    title: Text(
                      "Downloads",
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    leading: Icon(Icons.upload_file_outlined),
                    trailing: Icon(Icons.chevron_right),
                    title: Text(
                      "Posts",
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    leading: Icon(Icons.more_time_outlined),
                    trailing: Icon(Icons.chevron_right),
                    title: Text(
                      "History",
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.chevron_right),
                    title: Text(
                      "Friends",
                    ),
                  ),
                ),
                const Divider(
                  height: 10.0,
                  thickness: 1.0,
                  color: Color(Config.colorDarkGrey),
                ),
                InkWell(
                  onTap: () async {
                    // send http request to logout link
                    await http.post(
                        Uri.parse(Config.logoutLink),
                        body: {
                          "email": data[Config.email] as String
                        }
                    ).then((response){
                      if ( response.body.isNotEmpty ) {
                        final decodedLogout = jsonDecode(response.body);
                        if ( decodedLogout['logout']['success'] ) userNotifier.setLoggedOut();
                      }
                    });
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    trailing: Icon(Icons.chevron_right),
                    title: Text(
                      "Logout",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // not being used - can be deleted later
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
