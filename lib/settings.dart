import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'components/app_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: formelaAppBar(titleName: "SETTINGS"),
      body: Center(
        child: MaterialButton(
          color: Colors.yellowAccent,
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, '/landingPage');
          },
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
