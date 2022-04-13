import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:startup_namer/bluetooth_test_page.dart';
import 'package:startup_namer/landingPage.dart';
import 'services/ServiceLocator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'pages/homePage.dart';
import 'landingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  setupServiceLocator(); //dependencies injection

  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.production");
  } else {
    await dotenv.load(fileName: ".env.development");
  }

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  void initState() {
    print('APP STARTED RUNNING');
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    //home: LandingPage(),

    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => LandingPage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/homePage': (context) => HomePage(),
    },
  );
}