import 'package:flutter/material.dart';
import 'package:startup_namer/services/CommonState.dart';
import 'homePageView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends CommonState {
  @override
  Widget build(BuildContext context) {
    return buildHomePageView(context);
  }
}