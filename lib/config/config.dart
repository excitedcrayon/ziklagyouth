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
  static const String contactsPageHeading = "Contacts";
  static const String favouritesHeading = "Favourites";

  // Links
  static const String HOME_IP_ADDRESS = "10.1.1.170";
  static const String WORK_IP_ADDRESS = "10.4.40.164";
  static const String UNIT_IP_ADDRESS = "192.168.15.3";
  static const String GAUTENG_IP_ADDRESS = "192.168.0.110";
  static const String DOMAIN = (!production) ? "http://$GAUTENG_IP_ADDRESS/ziklagyouthapi" : "";
  static const String registerLink = "$DOMAIN/register";
  static const String loginLink = "$DOMAIN/login";
  static const String logoutLink = "$DOMAIN/logout";
  static const String authenticated = "$DOMAIN/authenticated";
  static const String mediaLink = "$DOMAIN/mediaupload";
  static const String uploadsLink = "$DOMAIN/uploads";

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
  static const double iconSize = 20.0;
  static const double iconMediumSize = 50.0;

  static const double defaultLoadingTimer = 10.0;

  static const int gridCount = 3;

  static const String prefsAuthenticated = "authenticated";
  static const String userData = "userData";
  static const String authCookieToken = "authCookieToken";
  static const String email = "email";
  static const String firstname = "firstname";
  static const String middlename = "middlename";
  static const String lastname = "lastname";
  static const String phone = "phone";
  static const String physicalAddress = "physicalAddress";
  static const String profilePic = "profilePic";
  static const String accountType = "accountType";
  static const String guest = "Guest";
  static const String editProfile = "Edit Profile";
}