
import 'package:flutter_auth/models/User.dart';
import 'package:flutter_auth/models/learning_entity.dart';
import 'package:flutter_auth/network/network.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:flutter_auth/utils/env_config.dart';

class AccountServices {
  static Future<User> login(String login, String password) async {
    Network registerNetwork = Network('https://58d1f787f250.ngrok.io/api/auth/login');
    var body = {"email": login, "password": password};
    var data = await registerNetwork.postData(body);
    if (data == null) {
      return null;
    } else {
      var user = User.fromJson(data["user"]);
      return user;
    }
  }

  static Future<User> register(body) async {
    Network registerNetwork =
        Network('https://58d1f787f250.ngrok.io/api/auth/signup');
    var data = await registerNetwork.postData(body);
    if (data == null) {
      return null;
    } else {
      var user = User.fromJson(data["user"]);
      return user;
    }
  }
  static Future<List<Test>> getFeeds() async {
    Network registerNetwork = Network(
        'https://api.thingspeak.com/channels/1238505/fields/1.json?api_key=U1ZORJ3SLGHH9WAO&results=2');
    var data = await registerNetwork.getData();
    var list = data['response'] as List;
    return list.map((v) => Test.fromJson(v as Map<String, dynamic>)).toList();
  }

 static Future<bool> updateProfile(body) async {
    Network registerNetwork = Network(
        '${EnvironmentConfig.BACKEND_URL}/account/${AuthService.currentUser.id ?? ""}');
    var data = await registerNetwork.putData(body);
    if (data == null) {
      return false;
    } else {
      AuthService.refreshCurrentUser();
      return true;
    }
  }

  static Future<User> getCurrentUser() async {
    Network registerNetwork = Network(
        '${EnvironmentConfig.BACKEND_URL}/account/${AuthService.currentUser?.id ?? ""}');
    var data = await registerNetwork.getData();
    if (data == null) {
      return null;
    } else {
      var user = User.fromJson(data["account"]);
      return user;
    }
  }
}

