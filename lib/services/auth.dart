import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:project1/models/User.dart';
import 'package:project1/services/dio.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  late User _user;
  late String token;
  String bearer = "Bearer";
  bool get authenticated => _isLoggedIn;
  User get user => _user;

  void login({Map? creds}) async {
    // print(creds);
    Dio.Response response = await dio().post('/login', data: creds);
    //  print(response.data.toString());
    token = response.data.toString();
    this.getUser(token: token);
  }

  void register({Map? creds}) async {
    Dio.Response response = await dio().post('/register', data: creds);
    this._isLoggedIn = true;
    print(response);
  }

  void getUser({required String token}) async {
    print(bearer + token);
    try {
      Dio.Response response = await dio().get('/get_user',
          options: Dio.Options(headers: {'Authorization': bearer + token}));
      print(response);
      this._isLoggedIn = true;
      this._user = User.fromJson(response.data);
      notifyListeners();
      print(_user);
    } catch (e) {
      print(e);
    }
  }

  void store({Map? creds}) async {
    String userToken = token;
    try {
      Dio.Response response = await dio().post('/request',
          options: Dio.Options(headers: {'Authorization': bearer + userToken}),
          data: creds);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    Dio.Response response = await dio().get('/logout',
        options: Dio.Options(headers: {'Authorization': 'B$token'}));
    _isLoggedIn = false;
    notifyListeners();
  }
}
