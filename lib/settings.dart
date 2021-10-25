// ignore_for_file: prefer_const_constructors

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
      backgroundColor: const Color.fromRGBO(65, 62, 75, 0.9),
      body: Center(
        child: Container(
          height: 50.0,
          child: GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/landingPage');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 189, 89, 1),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Center(
                    child: Text(
                      "LOGOUT",
                      style: TextStyle(
                        color: Color.fromRGBO(65, 62, 75, 1),
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
