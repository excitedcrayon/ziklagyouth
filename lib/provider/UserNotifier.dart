import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ziklagyouth/config/config.dart';

class UserNotifier extends ChangeNotifier {

  List<String> _loginData = [];

  String _userData = '';

  List<String> get loginData => _loginData;

  String get userData => _userData;

  UserNotifier() {
    initPreferences();
  }

  void initPreferences() async {
    await SharedPreferences.getInstance();
  }

  Future<void> setAuthenticated(List<String> loginDataList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(Config.prefsAuthenticated, loginDataList);
    notifyListeners();
  }

  Future<void> setUserData(String userData) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Config.userData, userData);
    notifyListeners();
  }

  Future<void> getAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    _loginData = prefs.getStringList(Config.prefsAuthenticated) ?? [];
    notifyListeners();
  }

  Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _userData = prefs.getString(Config.userData) ?? "";
    notifyListeners();
  }

  Future<void> setLoggedOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(Config.prefsAuthenticated);
    prefs.remove(Config.userData);
    _loginData.clear();
  }

}