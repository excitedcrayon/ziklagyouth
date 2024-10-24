import 'package:shared_preferences/shared_preferences.dart';
import 'package:ziklagyouth/config/config.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setAuthenticated(List<String> loginDataList) async {
    loginDataList.removeAt(0); // remove 'true' from list
    print("Saving response data ${loginDataList}");
    await _prefs?.setStringList(Config.prefsAuthenticated, loginDataList);
  }

  static Future<List<String>?> getAuthenticated() async {
    print(_prefs?.getStringList(Config.prefsAuthenticated));
    return _prefs?.getStringList(Config.prefsAuthenticated);
  }
}
