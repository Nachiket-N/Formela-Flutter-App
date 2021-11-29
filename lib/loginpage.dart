// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

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
  var _LoginErrorMessage = "Login Error";
  var _LoginErrorVisibility = false;

  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      // print('Create Account Failed with error code: ${e.code}');
      setState(() {
        _LoginErrorMessage = e.code;
        _LoginErrorVisibility = true;
      });
    }
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      // print('Login Failed with error code: ${e.code}');
      setState(() {
        _LoginErrorMessage = e.code;
        _LoginErrorVisibility = true;
      });
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
              cursorColor: const Color.fromRGBO(65, 62, 75, 1),
              style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
              onChanged: (value) {
                _email = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Email Address",
                fillColor: Colors.white,
                filled: true,
              ),
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
            Container(
              child: Visibility(
                visible: _LoginErrorVisibility,
                child: Text(
                  _LoginErrorMessage,
                  style: TextStyle(color: Colors.red, fontFamily: 'Montserrat'),
                ),
              ),
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
