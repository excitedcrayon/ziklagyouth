import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

    List<String> loginDataList = [];

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

        if ( response.body.isNotEmpty ) {

          final setCookie = response.headers['set-cookie'];
          final decodedLogin = jsonDecode(response.body);

          if ( decodedLogin['login']['success'] == true ) {
            
            final setCookieRegex = RegExp(r"authentication=([^;]+)");
            final setCookieRegexMatch = setCookieRegex.firstMatch(setCookie!);
            final authentication = setCookieRegexMatch?.group(1);

            decodedLogin['login']['authCookieToken'] = authentication;

            UserNotifier().setUserData(jsonEncode(decodedLogin['login']));

            if ( context.mounted ) {
              CustomWidget.notificationWithContext(context, "Authentication successful");
              Navigator.of(context).pop();
            }

          } else {
            if ( context.mounted ) {
              CustomWidget.notificationWithContext(context, decodedLogin['login']['message']);
            }
          }

        }

      }).catchError((error) {});

    } else {
      CustomWidget.notificationWithContext(context, "Please complete form");
    }

  }

  @override
  Widget build(BuildContext context) {

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
