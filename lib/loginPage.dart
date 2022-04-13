import 'package:flutter/material.dart';
import 'models/UserModel.dart';
import 'services/UserService.dart';
import 'services/ServiceLocator.dart';

class LoginPage extends StatefulWidget {
  // this is the way to receive parameters on statefulWidget
  const LoginPage({required this.onPressed, Key? key}) : super(key: key);
  final Function onPressed;

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _isLogged = false;
  bool _loginTry = false;
  final UserService userService = getIt<UserService>();

  Future<void> _login(String email, String password) async {
    try {
      UserModel user = await userService.login(email, password);

      print("USER NAME: " + user.name);
      print("USER ID: " + user.userId.toString());

      if (user.name != '') {
        setState(() {
          _loginTry = true;
          _isLogged = true;
        });
      } else {
        setState(() {
          _loginTry = true;
          _isLogged = false;
        });
      }

      if (_isLogged) {
        print("ESTOY LOGUEADO");
        widget.onPressed(user); // this is the call to the parent Widget method, sent as property
      }


    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  final Widget errorSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text('Incorrect login data', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
            ),
            Text('Modify your data and try again', style: TextStyle(color: Colors.grey[500])),
          ],
        )),
        Icon(
          Icons.warning,
          color: Colors.red[500],
        ),
        const Text('41'),
      ],
    )
  );

  @override
  Widget build(BuildContext context) {
    // ···
    return Column(
      children: [
        Center(
            child: ElevatedButton(
              child: const Text('Click to login'),
              onPressed: () => _login('user@user.com', 'adminUser'),
            )
        ),
        Visibility(
          visible: !_isLogged && _loginTry,
          child: errorSection,
        )
      ],
    );
  }
}

