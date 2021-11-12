import 'package:flutter/material.dart';

import './landingpage.dart';
import './filledforms.dart';
import './settings.dart';
import './pendingforms.dart';
import './components/Pending Form/pending_form_single.dart';

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
      routes: {
        '/landingPage': (context) => Landingpage(),
        '/filledForms': (context) => FilledForms(),
        '/pendingForms': (context) => PendingForms(),
        // '/pendingFormSingle': (context) => PendingFormSingle( ),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
