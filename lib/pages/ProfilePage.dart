import 'package:flutter/material.dart';
import 'package:ziklagyouth/helper/SharedPreferencesHelper.dart';
import 'package:ziklagyouth/pages/ProfileSubPages/LoginPage.dart';
import 'package:ziklagyouth/pages/ProfileSubPages/RegisterPage.dart';


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
    _loginDataList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _loginDataList() async {
    await SharedPreferencesHelper.init();
    List<String>? loginData = await SharedPreferencesHelper.getAuthenticated();
    setState(() {
      print(loginData?.length);
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                child: Text('Register'),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage())
                  );
                },
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
