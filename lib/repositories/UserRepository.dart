import 'dart:io';

import 'package:tiles/data/offline/LocalApiService.dart';
import 'package:tiles/data/remote/AppExceptions.dart';
import 'package:tiles/data/remote/network/ApiEndpoints.dart';
import 'package:tiles/data/remote/network/NetworkApiService.dart';
import 'package:tiles/models/Product.dart';
import 'package:tiles/models/User.dart';

class UserRepository {
  final NetworkApiService _apiService = NetworkApiService();
  final LocalApiService _localApiService = LocalApiService();

  Future<User> postLogin(String username, String password) async {
    try {
      Map<String, dynamic> content = {
        "username": username,
        "Password": password,
        "UserType": "C",
        "DeviceType": "android",
        "DeviceToken":
            "d9dEBLEnW7c:APA91bHgumnxZUtIO- a75R2Lhil5Se5BCmtSSOlObvYHDDb56Y7KJG70E8Knie4-P7s2w0ga5e- FqAT6LRd5JydVdJZKlNl2C1holrqAUW6jCk316odO7CFCHcqrRJLHd70Z8iDqII-t",
      };
      dynamic response =
          await _apiService.postResponse(ApiEndPoints.loginUrl, null, content);
      final list = response["data"].map((data) => User.fromJson(data)).toList();
      await _localApiService.saveUserAndToken(list[0], response["token"]);
      return list[0];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isLoggedIn() async {
    String? token = await _localApiService.getToken();
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Product>> getProducts(int pageNo, int pageSize) async {
    try {
      String? token = await _localApiService.getToken();
      Map<String, dynamic> content = {
        "Product_iD": null,
        "PageNo": pageNo,
        "PageSize": pageSize,
        "Search": null
      };
      dynamic response = await _apiService.postResponse(
          ApiEndPoints.productsUrl, token, content);

      List<Product> list =
          response["data"].map<Product>((data) => Product.fromJson(data)).toList();
      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUser() async {
    return _localApiService.getUser();
  }

  Future logOut() async {
    return _localApiService.removeUserAndToken();
  }
}
