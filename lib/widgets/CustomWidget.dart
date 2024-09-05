import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ziklagyouth/config/dictionary.dart';

import '../config/config.dart';

abstract class CustomWidget {
  static SizedBox renderText(String myText, double fontSize, FontWeight myWeight, int myColor){
    return SizedBox(
      width: double.infinity,
      child: Text(
        myText,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: (fontSize == 0.0) ? Config.headingSizeLarge : fontSize,
          fontWeight: (myWeight != null || myWeight == "") ? myWeight : FontWeight.w300,
          color: (myColor == 0) ? const Color(Config.colorBlackThree) : Color(myColor)
        ),
      ),
    );
  }
  static SizedBox verticalMargin(){
    return const SizedBox(
      height: 25.0,
    );
  }
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> notificationWithContext(BuildContext context, String message){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              message,
              style: const TextStyle(
                fontSize: Config.headingSizeLarge * 0.9
              ),
            ),
            const SizedBox(
              width: Config.iconMediumSize * 0.5,
              height: Config.iconMediumSize * 0.5,
              child: CircularProgressIndicator(
                color: Color(Config.colorGold),
              ),
            ),
          ],
        ),
        duration: const Duration(
          seconds: 3
        ),
        behavior: SnackBarBehavior.floating,
        elevation: Config.iconSize,
      ),
    );
  }
  static Container formTextField(TextEditingController textEditingController, String labelText, String validatorMessage){
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
  static Container formTextFieldCanBeNull(TextEditingController textEditingController, String labelText, String validatorMessage){
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
  static Container formNumberField(TextEditingController textEditingController, String labelText, String validatorMessage){
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
  static Container formPasswordField(TextEditingController textEditingController, String labelText, String validatorMessage, bool obscurePasswordText){
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
        obscureText: obscurePasswordText,
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
  static InkWell registerButton(BuildContext context, Function(BuildContext) callbackFunction) {
    return InkWell(
      onTap: () {
        callbackFunction(context);
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
  static InkWell loginButton(BuildContext context, Function(BuildContext) callbackFunction) {
    return InkWell(
      onTap: () {
        callbackFunction(context);
      },
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(Config.defaultPadding * 0.8),
          decoration: BoxDecoration(
            color: const Color(Config.colorBlackTwo),
            border: Border.all(
                color: const Color(Config.colorBlackTwo),
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
              Dictionary.signIn,
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
  static InkWell cancelButton(BuildContext context){
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