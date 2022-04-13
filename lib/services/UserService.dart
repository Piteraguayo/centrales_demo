import 'package:startup_namer/models/UserModel.dart';

abstract class UserService {
  Future<UserModel> login(String email, String password);
  Future<void> logout();
  Future<UserModel> getUserByIdAndToken(String userId, String token);
}