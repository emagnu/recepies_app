//  ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
//  Import FILES
import '../models/user.dart';
import 'http_service.dart';
//  //   ///

//  Singleton class
class AuthService {
  static final AuthService _singleton = AuthService._internal();
  final _httpService = HTTPService();
  User? user;

  factory AuthService() {
    return _singleton;
  }

  AuthService._internal();

  Future<bool> login(String username, String password) async {
    debugPrint("$username - $password");
    // return false;
    try {
      var response = await _httpService.post('auth/login', {
        'username': username,
        'password': password,
      });
      debugPrint(response?.statusCode.toString());
      if (response?.statusCode == 200 || response?.data != null) {
        debugPrint(response!.data);
        user = User.fromJson(response.data);
        debugPrint(user.toString());
        HTTPService().setup(bearerToken: user!.token);
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
