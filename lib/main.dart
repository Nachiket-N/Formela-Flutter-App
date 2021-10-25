import 'package:flutter/material.dart';

import './landingpage.dart';
import './filledforms.dart';
import './settings.dart';
import './pendingforms.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landingpage(),
      // home: Scaffold(
      //     appBar: formelaAppBar(titleName: "FORMELA"),
      //     drawer: const formelaDrawer(
      //         username: "Nachiket Naik", email: "nnn@somaiya.edu"),
      //     body: const Center(
      //       child: Text(
      //         "HOME PAGE",
      //       ),
      //     )),
      routes: {
        '/landingPage': (context) => Landingpage(),
        '/filledForms': (context) => FilledForms(),
        '/pendingForms': (context) => PendingForms(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
