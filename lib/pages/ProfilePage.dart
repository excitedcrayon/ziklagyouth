import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ziklagyouth/config/config.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
  }

  Future<void> postRegisterFormData() async {
    var response = Uri.parse(Config.registerLink);

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

        if ( response.statusCode == 200 ) {
          print(response.body);
        } else {
          print("Did not work");
        }

      } catch(e) {
        print("Register Form Data Exception: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _registerFormKey,
            child: Padding(
              padding: const EdgeInsets.all(Config.defaultPadding),
              child: Column(
                children: <Widget>[
                  formTextField(_firstnameController, "Firstname", "Please enter firstname"),
                  formTextFieldCanBeNull(_middlenameController, "Middlename", ""),
                  formTextField(_lastnameController, "Lastname", "Please enter lastname"),
                  formNumberField(_phoneController, "Phone", "Please enter phone number"),
                  formTextField(_emailController, "Email", "Please enter email"),
                  formPasswordField(_passwordController, "Password", "Please enter password"),
                  ElevatedButton(
                    onPressed: postRegisterFormData,
                    child: Text('Register'),
                  )
                ],
              ),
            ),
          
          ),
        ),
      ),
    );
  }

  TextFormField formTextField(TextEditingController textEditingController, String labelText, String validatorMessage){
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText
      ),
      validator: (value) {
        return ( value == null || value.isEmpty ) ? validatorMessage : null;
      },
    );
  }

  TextFormField formTextFieldCanBeNull(TextEditingController textEditingController, String labelText, String validatorMessage){
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          labelText: labelText
      ),
      validator: (value) {
        return ( value == null || value.isEmpty ) ? null : null;
      },
    );
  }

  TextFormField formNumberField(TextEditingController textEditingController, String labelText, String validatorMessage){
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          labelText: labelText
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        return ( value == null || value.isEmpty ) ? validatorMessage : null;
      },
    );
  }

  TextFormField formPasswordField(TextEditingController textEditingController, String labelText, String validatorMessage){
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          labelText: labelText
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
    );
  }
}
