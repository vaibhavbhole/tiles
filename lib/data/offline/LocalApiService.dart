import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiles/models/User.dart';

class LocalApiService {
  Future saveUserAndToken(User user, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user);
    sharedPreferences.setString("user", userJson);
    sharedPreferences.setString("token", token);
  }

  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("token");
  }

  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? savedUser = sharedPreferences.getString("user");
    Map<String, dynamic> userMap = jsonDecode(savedUser!);
    return User.fromJson(userMap);

  }

  Future removeUserAndToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
