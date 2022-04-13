
class UserModel {
  final String name;
  String userId;
  final String token;
  String? email;

  UserModel(this.name, this.userId, this.token, [this.email]); // token is optional.
  // If it would be a default value:
  // UserModel(this.name, this.userId, {this.token = 'xxxxx'});
  //and remove the ? from the final declaration
}