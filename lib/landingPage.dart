import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'services/PreferencesService.dart';
import 'services/ServiceLocator.dart';
import 'models/PreferencesModel.dart';
import 'models/UserModel.dart';
import 'services/CommonState.dart';

// this widget could not be useful but it's done to have an example of how to send parameters to a child widget (in this case: onPressed to LoginPage)
// LoginPage could have been added to the "/" route on main.dart

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState<LandingPage> extends CommonState {
  void _setLoggedSuccessful(UserModel user) async {
    if(user.userId != '' && user.token != '') {
      PreferencesService preferencesService = getIt<PreferencesService>();
      preferencesService.setPreferences(PreferencesModel(user.userId, user.token));
      Navigator.pushNamed(context, '/homePage');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Login Demo"),
      automaticallyImplyLeading: false,
    ),
    body: LoginPage(onPressed: _setLoggedSuccessful),
  );
}