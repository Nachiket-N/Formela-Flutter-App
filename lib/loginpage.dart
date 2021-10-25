// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          print("Email already used. Go to login page.");
          break;
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          print("Wrong email/password combination.");
          break;
        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          print("No user found with this email.");
          break;
        case "ERROR_USER_DISABLED":
        case "user-disabled":
          print("User disabled.");
          break;
        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
          print("Too many requests to log into this account.");
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
        case "operation-not-allowed":
          print("Server error, please try again later.");
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          print("Email address is invalid.");
          break;
        default:
          print("ERROR::::::" + e.code);
          print("Login failed. Please try again.");
          break;
      }
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      //   print(e.message);
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(65, 62, 75, 0.9),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 40,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'All Rights Reserved @FORMELA 2021, Created By: Amo.Mrun.Nachi.Nav',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          key: formkey,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            const Text(
              'Hello!',
              style: TextStyle(
                color: Color.fromRGBO(255, 189, 89, 1),
                fontFamily: 'Montserrat',
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
            const Text(
              "Let's kickstart in",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
            const Text(
              "FORMELA",
              style: TextStyle(
                color: Color.fromRGBO(255, 189, 89, 1),
                fontFamily: 'Montserrat',
                fontSize: 24,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return ('email cannot be empty');
                } else {
                  return ('email correct');
                }
              },
              cursorColor: const Color.fromRGBO(65, 62, 75, 1),
              style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
              onChanged: (value) {
                _email = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Email Address',
                fillColor: Colors.white,
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              obscureText: true,
              style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Password',
                fillColor: Colors.white,
                filled: true,
              ),
              onChanged: (value) {
                _password = value;
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  height: 40,
                  color: const Color.fromRGBO(255, 189, 89, 1),
                  onPressed: _login,
                  child: const Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ),
                const Text(
                  'OR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
                MaterialButton(
                  color: const Color.fromRGBO(255, 189, 89, 1),
                  onPressed: _createUser,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  height: 40,
                  child: const Text(
                    'Create New Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
