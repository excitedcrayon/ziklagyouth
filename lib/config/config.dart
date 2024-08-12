/**
 *  Config.dart is an abstract class that contains all the constants and parameters to be used
 *  across the entire app.
 */

abstract class Config {
  static const bool production = false;
  // properties
  static const String appName = "Ziklag Youth";
  static const double appVersion = 1.0;

  // headings
  static const String welcomeText = "Welcome";
  static const String latestPostsHeading = "Latest Posts";

  // Links

  // Colors
  static const int colorBlack = 0xFF000000;
  static const int colorBlackTwo = 0xFF1E1D22;
  static const int colorBlackThree = 0xFF1A1A1A;
  static const int colorGold = 0xFFDBA860;
  static const int colorLightGrey = 0xFFEEEEEE;
  static const int colorDarkGrey = 0xFFCCCCCCC;
  static const int colorPurple = 0xFFA7508B;
  static const int colorRed = 0xFFDD3333;
  static const int colorWhite = 0xFFFFFFFF;

  // size parameters
  static const double headingHeight = 150.0;
  static const double defaultPadding = 20.0;
  static const double verticalPadding = defaultPadding;
  static const double horizontalPadding = defaultPadding;
  static const double headingSizeLarge = 20.0;
  static const double headingSizeXLarge = 40.0;
  static const double headingSizeXXLarge = 60.0;
  static const double cardWidth = 160.0;
  static const double cardHeight = 200.0;
}