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

        if ( response.body.isNotEmpty ) {

          final decodedRegister = jsonDecode(response.body);
          final registerData = decodedRegister['register'];

          if ( registerData['success'] ) {
            CustomWidget.notificationWithContext(context, registerData['message']);
          } else {
            CustomWidget.notificationWithContext(context, registerData['message']);
          }
        }

      } catch(e) {
        CustomWidget.notificationWithContext(context, "$e");
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
                    formTextField(_firstnameController, "John", "Please enter firstname"),
                    formTextFieldCanBeNull(_middlenameController, "", ""),
                    formTextField(_lastnameController, "Doe", "Please enter lastname"),
                    formNumberField(_phoneController, "027xxxxxx", "Please enter phone number"),
                    formTextField(_emailController, "email@tld.com", "Please enter email"),
                    formPasswordField(_passwordController, "Password", "Please enter password"),
                    registerButton(),
                    cancelButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container formTextField(TextEditingController textEditingController, String labelText, String validatorMessage){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: Config.defaultPadding * 0.5
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: const TextStyle(
            color: Color(Config.colorDarkGrey),
          ),
          errorText: validatorMessage,
        ),
        validator: (value) {
          return ( value == null || value.isEmpty ) ? validatorMessage : null;
        },
      ),
    );
  }

  Container formTextFieldCanBeNull(TextEditingController textEditingController, String labelText, String validatorMessage){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          vertical: Config.defaultPadding * 0.5
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: const TextStyle(
            color: Color(Config.colorDarkGrey),
          ),
        ),
        validator: (value) {
          return ( value == null || value.isEmpty ) ? null : null;
        },
      ),
    );
  }

  Container formNumberField(TextEditingController textEditingController, String labelText, String validatorMessage){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          vertical: Config.defaultPadding * 0.5
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: const TextStyle(
            color: Color(Config.colorDarkGrey),
          ),
          errorText: validatorMessage
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          return ( value == null || value.isEmpty ) ? validatorMessage : null;
        },
      ),
    );
  }

  Container formPasswordField(TextEditingController textEditingController, String labelText, String validatorMessage){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          vertical: Config.defaultPadding * 0.5
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: const TextStyle(
            color: Color(Config.colorDarkGrey),
          ),
          errorText: validatorMessage,
        ),
        keyboardType: TextInputType.number,
        obscureText: _obscurePasswordText,
        validator: (value) {
          if ( value == null || value.isEmpty ) {
            return validatorMessage;
          } else if ( value.length < 8 ) {
            return "Password must be 8 characters long";
          } else { return null; }
        },
      ),
    );
  }

  InkWell registerButton(){
    return InkWell(
      onTap: (){
        postRegisterFormData(context);
      },
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(Config.defaultPadding * 0.8),
          decoration: BoxDecoration(
            color: const Color(Config.colorBlack),
            border: Border.all(
                color: const Color(Config.colorBlack),
                width: 3.0
            ),
            borderRadius: BorderRadius.circular(Config.defaultPadding * 5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
                vertical: Config.defaultPadding / 2,
                horizontal: Config.defaultPadding
            ),
            child: Text(
              Dictionary.signUp,
              style: TextStyle(
                  color: Color(Config.colorWhite),
                  fontSize: Config.headingSizeLarge * 1.1,
                  fontWeight: FontWeight.w600
              ),
            ),
          )
      ),
    );
  }

  InkWell cancelButton(){
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(Config.defaultPadding * 0.8),
          decoration: BoxDecoration(
            color: const Color(Config.colorRed),
            border: Border.all(
                color: const Color(Config.colorRed),
                width: 3.0
            ),
            borderRadius: BorderRadius.circular(Config.defaultPadding * 5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
                vertical: Config.defaultPadding / 2,
                horizontal: Config.defaultPadding
            ),
            child: Text(
              Dictionary.cancel,
              style: TextStyle(
                  color: Color(Config.colorWhite),
                  fontSize: Config.headingSizeLarge * 1.1,
                  fontWeight: FontWeight.w600
              ),
            ),
          )
      ),
    );
  }
}
