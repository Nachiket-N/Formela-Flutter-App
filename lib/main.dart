import 'package:flutter/material.dart';

import 'components/app_bar.dart';
import 'components/drawer.dart';

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
      home: Scaffold(
          appBar: formelaAppBar(titleName: "FORMELA"),
          drawer: const formelaDrawer(
              username: "Nachiket Naik", email: "nnn@somaiya.edu"),
          body: const Center(
            child: Text(
              "HOME PAGE",
            ),
          )),
      routes: {
        '/filledForms': (context) => FilledForms(),
        '/pendingForms': (context) => PendingForms(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
