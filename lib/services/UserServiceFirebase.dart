import 'UserService.dart';
import 'package:startup_namer/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:startup_namer/firebase_options.dart';

class UserServiceFirebase extends UserService {
  @override
  Future<UserModel> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      if (userCredential.user?.uid != '' && userCredential.user?.refreshToken != '' ) {
        final String? userId = userCredential.user?.uid;
        final String? token = userCredential.user?.refreshToken;

        return UserModel('Pedro', userId!, token!);
      }
    } on FirebaseAuthException catch (e) {

      print('@@@ Error on FIREBASE');
      print(e);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    return UserModel('', '', '');
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserModel> getUserByIdAndToken(String userId, String token) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      print('"USER FROM FIREBASE"');
      print(user);

      if (user.uid != '' && user.refreshToken != '' ) {
        final String? userId = user.uid;
        final String? token = user.refreshToken;

        return UserModel('Pedro', userId!, token!);
      }
    } else {
      print("No HAY USUARIO DE FIREBASE");
    }

    return UserModel('', 'fakeUSerId', '');
  }

}