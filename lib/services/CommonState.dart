import 'package:flutter/material.dart';
import 'PreferencesService.dart';
import 'ServiceLocator.dart';
import 'package:startup_namer/models/UserModel.dart';
import 'UserService.dart';
import 'package:startup_namer/models/PreferencesModel.dart';

abstract class CommonState<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    checkUserInPreferences();
    print('THIS IS SUPER STATE');
    super.initState();
  }

  void checkUserInPreferences() async {
    PreferencesService preferencesService = getIt<PreferencesService>();
    PreferencesModel preferences = await preferencesService.getPreferences();

    if (preferences.userId != '' && preferences.token != '') {
      UserService userService = getIt<UserService>();
      UserModel user = await userService.getUserByIdAndToken(preferences.userId, preferences.token);

      print('user.userId: ' + user.userId + ' >>>  preferences.userId: ' + preferences.userId);

      if (user.userId != '' && user.userId == preferences.userId && user.token != '') {
        String currentRoute = '';

        Navigator.popUntil(context, (route) {
          currentRoute = route.settings.name.toString();
          return true;
        });

        if (currentRoute != '/homePage') {
          Navigator.pushNamed(context, '/homePage');
        }
      } else {
        goToRoot();
      }
    }  else {
      goToRoot();
    }
  }

  void goToRoot() {
    String currentRoute = '';

    Navigator.popUntil(context, (route) {
      currentRoute = route.settings.name.toString();
      return true;
    });

    //PreferencesService preferencesService = getIt<PreferencesService>();

    //preferencesService.clearPreferences();
    if (currentRoute != '/') {
      Navigator.pushNamed(context, '/');
    }
  }
}