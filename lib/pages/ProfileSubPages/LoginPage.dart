import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:ziklagyouth/config/dictionary.dart';
import 'package:ziklagyouth/provider/UserNotifier.dart';
import 'package:ziklagyouth/widgets/CustomWidget.dart';
import 'package:ziklagyouth/config/config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _loginFormKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final bool _obscurePasswordText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  Future<void> postLoginFormData(BuildContext context) async {

    if ( _loginFormKey.currentState?.validate() ?? false ) {
      final username = _usernameController.text;
      final password = _passwordController.text;

      await http.post(
        Uri.parse(Config.loginLink),
        body: {
          "username": username,
          "password": password
        }
      ).then((response) {
        // render result here and do all the thingy majig
        print("Checking result from postLoginFormData async");
        print(response.body);

        if ( response.body.isNotEmpty ) {

          final decodedLogin = jsonDecode(response.body);

          if ( decodedLogin['login']['success'] == true ) {

            Map<String, dynamic> decodedResponse = jsonDecode(response.body);
            Map<String, dynamic> loginData = decodedResponse['login'];
            List<String> loginDataList = loginData.values.map((value) => value.toString()).toList();

            //await UserNotifier().setAuthenticated(loginDataList);

            if ( context.mounted ) {
              print("Context is mounted for LoginPage.dart");
              CustomWidget.notificationWithContext(context, "Authentication successful");
              Navigator.of(context).pop();
            }

          } else {
            if ( context.mounted ) {
              CustomWidget.notificationWithContext(context, decodedLogin['login']['message']);
            }
          }

        }

      }).catchError((error) {

        print("login http form exception: $error");

      });

    } else {
      CustomWidget.notificationWithContext(context, "Please complete form");
    }

  }

  @override
  Widget build(BuildContext context) {

    //final userNotifier = Provider.of<UserNotifier>(context);

    //userNotifier.getAuthenticated();
    //print("printing authenticated data");
    //print(userNotifier.loginData);

    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: _loginFormKey,
            child: Padding(
              padding: const EdgeInsets.all(Config.defaultPadding),
              child: Column(
                children: <Widget>[
                  CustomWidget.renderText(
                    Dictionary.login,
                    Config.headingSizeXLarge,
                    FontWeight.w300,
                    Config.colorBlack
                  ),
                  CustomWidget.formTextField(_usernameController, "John", "Please enter firstname"),
                  CustomWidget.formPasswordField(_passwordController, "", "Please enter password", _obscurePasswordText),
                  CustomWidget.loginButton(context, (context) => postLoginFormData(context)),
                  CustomWidget.cancelButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
