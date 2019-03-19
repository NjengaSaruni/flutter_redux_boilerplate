import 'dart:async';

import 'package:iSave/models/user.dart';
import 'package:iSave/services/main.service.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://localhost:8000/api/v1/";
  static final LOGIN_URL = BASE_URL + "rest-auth/login/";

  Future<User> login(String email, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "email": email,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.fromJSON(res["user"]);
    });
  }
}