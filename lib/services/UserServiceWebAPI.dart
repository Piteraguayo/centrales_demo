import 'UserService.dart';
import 'package:startup_namer/models/UserModel.dart';
import 'package:startup_namer/helpers/UserHelper.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// implementation of UserService.dart
class UserServiceWebAPI extends UserService {
  final String APIUrl = dotenv.env['USER_API_URL'].toString();

  @override
  Future<UserModel> login(String email, String password) async {
    final Uri url = Uri.parse(APIUrl + 'check_login.php');
    final Object body = {'email': email, 'password': password};

    return await sendUserPost(url, body);
  }
  @override
  Future<void> logout() async {
    final url = Uri.parse(APIUrl + 'login_success.php');
    Response response = await get(url);
    String json = response.body;
    print('JSON: ' + json);
  }

  @override
  Future<UserModel> getUserByIdAndToken(String userId, String token) async {
    final url = Uri.parse(APIUrl + 'check_user_token.php');
    final Object body = {'userId': userId, 'token': token};

    return await sendUserPost(url, body);
  }

  Future<UserModel> sendUserPost(Uri url, Object body) async {
    Response response = await post(url, body: body);

    if ((response.statusCode == 200)) {
      String json = response.body;

      return UserHelper().setUserModelFromJsonString(json);
    }

    return UserModel('', '', '');
  }
}