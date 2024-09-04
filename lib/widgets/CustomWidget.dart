import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
}