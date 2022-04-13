import 'dart:convert';
import 'package:startup_namer/models/UserModel.dart';

class UserHelper {
  UserModel setUserModelFromJsonString(String json) {
    Map<String, dynamic> mappedUser = jsonDecode(json);

    if (mappedUser.containsKey('name') && mappedUser.containsKey('userId') && mappedUser.containsKey('token')) {
      UserModel user = UserModel(mappedUser['name'], mappedUser['userId'], mappedUser['token']);

      if (mappedUser.containsKey('email')) { // this is optional
        user.email = mappedUser['email'];
      }

      return user;
    }

    return UserModel('', '', '');
  }
}