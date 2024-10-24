
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ziklagyouth/config/config.dart';

class UserNotifier extends ChangeNotifier {

  List<String> _loginData = [];

  List<String> get loginData => _loginData;

  UserNotifier() {
    initPreferences();
  }

  void initPreferences() async {
    await SharedPreferences.getInstance();
  }

  Future<void> setAuthenticated(List<String> loginDataList) async {
    loginDataList.removeAt(0);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(Config.prefsAuthenticated, loginDataList);
    notifyListeners();
  }

  Future<void> getAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    _loginData = prefs.getStringList(Config.prefsAuthenticated) ?? [];
    notifyListeners();
  }

  Future<void> setLoggedOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(Config.prefsAuthenticated);
    _loginData.clear();
  }

}