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
}