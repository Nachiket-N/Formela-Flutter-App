import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:formela/pendingforms.dart';

import './loginpage.dart';
import './pendingforms.dart';

class Landingpage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ), //Center
          ); //Scaffold
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  Object? user = snapshot.data;

                  if (user == null) {
                    return LoginPage();
                  } else {
                    return PendingForms();
                  }
                }
                return const Scaffold(
                  body: Center(
                    child: Text('checking login..'),
                  ),
                );
              });
        }
        return const Scaffold(
          body: Center(
            child: Text('connecting!'),
          ),
        );
      },
    );
  }
}
