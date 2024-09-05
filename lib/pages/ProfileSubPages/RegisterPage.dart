import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ziklagyouth/config/config.dart';
import 'package:ziklagyouth/config/dictionary.dart';
import 'package:ziklagyouth/widgets/CustomWidget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _registerFormKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _middlenameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePasswordText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstnameController.dispose();
    _middlenameController.dispose();
    _lastnameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> postRegisterFormData(BuildContext context) async {

    if ( _registerFormKey.currentState?.validate() ?? false ) {
      final firstname = _firstnameController.text;
      final middlename = _middlenameController.text;
      final lastname = _lastnameController.text;
      final phone = _phoneController.text;
      final email = _emailController.text;
      final password = _passwordController.text;

      try {
        final response = await http.post(
            Uri.parse(Config.registerLink),
            body: {
              'firstname': firstname,
              'middlename': middlename,
              'lastname': lastname,
              'phone': phone,
              'email': email,
              'password': password
            }
        );

        if ( response.body.isNotEmpty && context.mounted ) {

          final decodedRegister = jsonDecode(response.body);
          final registerData = decodedRegister['register'];

          if ( registerData['success'] ) {
            CustomWidget.notificationWithContext(context, registerData['message']);
            Navigator.pop(context);
          } else {
            CustomWidget.notificationWithContext(context, registerData['message']);
          }
        }

      } catch(e) {
        if ( context.mounted ) {
          CustomWidget.notificationWithContext(context, "$e");
        }
      }
    } else {
      CustomWidget.notificationWithContext(context, "Please complete form");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _registerFormKey,
              child: Padding(
                padding: const EdgeInsets.all(Config.defaultPadding),
                child: Column(
                  children: <Widget>[
                    CustomWidget.renderText(
                      Dictionary.createAccount,
                      Config.headingSizeXLarge,
                      FontWeight.w300,
                      Config.colorBlack
                    ),
                    CustomWidget.formTextField(_firstnameController, "John", "Please enter firstname"),
                    CustomWidget.formTextFieldCanBeNull(_middlenameController, "", ""),
                    CustomWidget.formTextField(_lastnameController, "Doe", "Please enter lastname"),
                    CustomWidget.formNumberField(_phoneController, "027xxxxxx", "Please enter phone number"),
                    CustomWidget.formTextField(_emailController, "email@tld.com", "Please enter email"),
                    CustomWidget.formPasswordField(_passwordController, "Password", "Please enter password", _obscurePasswordText),
                    CustomWidget.registerButton(context, (context) => postRegisterFormData(context)),
                    CustomWidget.cancelButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
