import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_auth/models/User.dart';
import 'package:flutter_auth/network/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService with ChangeNotifier {
  static User currentUser;
  static String access_token;
  static bool isFirstTime;

  AuthService() {
    print("new AuthService");
  }

  // Future =  waitinf for api to load data from server
  static Future setUser({User user}) async {
    AuthService.currentUser = user;
    log("Saved user :");
    log("user : ${user.toString()}");
   /* if (token != '') {
      AuthService.access_token = access_token;
      log("access_token : $access_token");
      final prefs = await SharedPreferences.getInstance();
      String userToStore = jsonEncode(user.toJson());
      log(userToStore);
      prefs.setString("access_token", access_token);
      prefs.setString("user", userToStore);
    }*/
  }

  static Future setFirstTime({bool firstTime}) async {
    log("is first time : ${firstTime.toString()}");
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("first", firstTime);
  }

  static void refreshCurrentUser() async {
    var newUser = await AccountServices.getCurrentUser();
    if (newUser != null) {
      AuthService.setUser(user: newUser);
    }
  }

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString("access_token");
    return access_token;
  }

  static Future<bool> checkIfFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool("first");
    return isFirstTime;
  }

  static Future<bool> isConnected() async {
    String token = await getToken();
    log("tokennnnn: $token");
    return token != "" && token != null;
  }

  static Future<User> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String storedUser = prefs.getString("user");
    if (storedUser == null) {
      return Future.value(null);
    }
    Map<String, dynamic> decodedUser = jsonDecode(storedUser);
    var user = User.fromJson(decodedUser);
    AuthService.currentUser = user;
    return Future.value(user);
  }

  /*static Future logout() async {
    AuthService.currentUser = null;
    AuthService.token = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", null);
    prefs.setString("user", null);
    return Future.value(currentUser);
  }*/
}
