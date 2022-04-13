import 'package:flutter/material.dart';
import 'package:startup_namer/services/PreferencesService.dart';
import 'package:startup_namer/services/ServiceLocator.dart';
import 'package:startup_namer/services/UserService.dart';

Scaffold buildHomePageView (BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Home Page'),

    ),
    body: const Center(
        child: Text('Home page content')
    ),
    drawer: Drawer(
      child: ListView(
// Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              logout(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {

              Navigator.pop(context); // Then close the drawer
            },
          ),
        ],
      ),
    ),

  );
}

void logout(BuildContext context) async {
  PreferencesService preferencesService = getIt<PreferencesService>();
  await preferencesService.clearPreferences();

  final UserService userService = getIt<UserService>();

  await userService.logout();
  print('ME HE DESLOGUEADO');
  Navigator.pushNamed(context, '/');
}